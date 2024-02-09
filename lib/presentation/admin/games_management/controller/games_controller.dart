import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/remote_data_source/admin_remote_data_source.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/controller/exercise_controller.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/Exercise.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/level.dart';
import 'package:let_s_have_fun/presentation/admin/games_management/model/game.dart';
import '../../../../core/app_export.dart';
class GameController extends GetxController {
  TextEditingController questionController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  TextEditingController successMessageController = TextEditingController();
  Rx<Level?> currentLevel = Rx<Level?>(null);
  Exercise? currentExercise;
  Rx<FlowState> state =
  Rx<FlowState>(EmptyState(AppStrings.chooseLevelOrEx));
  AdminRemoteDataSource remoteDataSource =
  Get.find<AdminRemoteDataSourceImpl>();
  Color? color;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextEditingController> imgsAnswerControllers = List.generate(
    6,
        (_) => TextEditingController(),
  );

  List<RxBool> isImgSelected = List.generate(6, (_) => false.obs,);

  void getLevel(Exercise exercise, Level level) {
    currentLevel.value = level;
    currentExercise = exercise;
    color = Get.find<ExerciseController>()
        .exercises
        .firstWhere((element) => element.uid == level.exerciseId)
        .color;

    if (level.games != null && level.games!.isNotEmpty) {
      var firstGame = level.games!.first;
      questionController.text = firstGame.question ?? '';
      successMessageController.text = firstGame.successMessage ?? '';
      imgController.text = firstGame.img ?? '';

      for (int i = 0; i < firstGame.imgsAnswer.length; i++) {
        imgsAnswerControllers[i].text = firstGame.imgsAnswer[i].url ?? '';
        isImgSelected[i].value = firstGame.imgsAnswer[i].isSelected ?? false;
      }
    } else {
      currentLevel.value!.games ??= [];
      currentLevel.value!.games!.add(Game(question: questionController.text));
      print('Added new game');
    }
    state.value = ContentState();
  }

  void checkImgSelected(int index) {
    int selectedCount = isImgSelected.where((rxBool) => rxBool.value).length;

    if (imgsAnswerControllers[index].text.isNotEmpty) {
      if (isImgSelected[index].value || selectedCount < 2) {
        isImgSelected[index].value = !isImgSelected[index].value;
      }
    }
    currentLevel.value?.games?.first.imgsAnswer[index].isSelected =
        isImgSelected[index].value;
  }

  void clearForm(int index) {
    imgsAnswerControllers[index].clear();
    currentLevel.value?.games?.first.imgsAnswer[index].url = null;
  }

  Future<void> getImage(int index) async {
    XFile? image = await _pickImage();
    imgsAnswerControllers[index].text = image?.name ?? '';
    currentLevel.value?.games?.first.imgsAnswer[index].url = image?.path;
  }

  Future<void> getQImage() async {
    XFile? image = await _pickImage();
    imgController.text = image?.name ?? '';
    currentLevel.value?.games?.first.img = image?.path;
  }

  Future<XFile?> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image =
      await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) return null;

      return image;
    } catch (e) {
      print("Error picking image: $e");
    }
    return null;
  }

  Future<void> saveGame() async {
    if (formKey.currentState?.validate() ?? false) {
      state.value = LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
        message: AppStrings.loading,
      );

      var levelGames = currentLevel.value?.games;

      if (levelGames != null && levelGames.isNotEmpty) {
        var game = levelGames.first;
        game.question = questionController.text;
        game.successMessage = successMessageController.text;
        game.exerciseId = currentExercise?.uid ?? '';
        game.levelId = currentLevel.value?.id ?? 0;
        game.id = 0;

        (await remoteDataSource.updateGameOfLevel(currentExercise!, game))
            .fold((failure) {
          state.value = ErrorState(
            StateRendererType.popupErrorState,
            failure.message,
          );
        }, (r) {
          if (currentLevel.value!.games == null) {
            currentLevel.value!.games = [r];
          } else {
            currentLevel.value!.games![0] = r;
          }
          state.value = SuccessState(
            StateRendererType.popupSuccessState,
            'تمت العملية بنجاح',
          );
        });
      } else {
        state.value = ErrorState(
          StateRendererType.popupErrorState,
          "يجب اختيار السؤال",
        );
      }
    } else {
      state.value = ErrorState(
        StateRendererType.popupErrorState,
        AppStrings.invalidData,
      );
    }
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.invalidData;
    } else {
      return null;
    }
  }

  String? validateList(String? value) {
    if (imgsAnswerControllers.any((element) => element.text.isNotEmpty)) {
      return null;
    } else {
      return AppStrings.invalidData;
    }
  }
}
