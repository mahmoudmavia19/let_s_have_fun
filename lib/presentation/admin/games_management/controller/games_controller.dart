import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/remote_data_source/admin_remote_data_source.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/controller/exercise_controller.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/Exercise.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/level.dart';
import '../../../../core/app_export.dart';

class GameController extends GetxController {
  TextEditingController questionController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  TextEditingController successMessageController = TextEditingController();
    Rx<Level?> currentLevel = Rx<Level?>(null);
    Exercise? currentExercise ;
    Rx<FlowState>  state = Rx<FlowState>(EmptyState(AppStrings.chooseLevelOrEx));
    AdminRemoteDataSource remoteDataSource = Get.find<AdminRemoteDataSourceImpl>();
    Color? color ;

    GlobalKey<FormState> formKey = GlobalKey<FormState>();


   getLevel(Exercise exercise,Level level){
    currentLevel.value= level;
    currentExercise = exercise;
    color = Get.find<ExerciseController>().exercises.firstWhere((element) => element.uid==level.exerciseId).color;
    questionController.text = level.games?.first.question??'';
    successMessageController.text = level.games?.first.successMessage??'';
    if(level.games!=null) {
      for (int i = 0; i < level.games!.first.imgsAnswer.length; i++) {
        imgsAnswerControllers[i].text =
            level.games?.first.imgsAnswer[i].url ?? '';
        isImgSelected[i].value = level.games?.first.imgsAnswer[i].isSelected ?? false;
      }
    }
    imgController.text = level.games?.first.img??'';
    state.value= ContentState();
   }

  List<TextEditingController> imgsAnswerControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<RxBool> isImgSelected = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];

  checkImgSelected(int index) {
    // Count the number of selected images
    int selectedCount = isImgSelected.where((rxBool) => rxBool.value).length;

    if(imgsAnswerControllers[index].text.isNotEmpty) {
      // Check if the maximum limit is reached (2)
    if (isImgSelected[index].value || selectedCount < 2) {
      isImgSelected[index].value = !isImgSelected[index].value;
    }
    }
    currentLevel.value?.games?.first.imgsAnswer[index].isSelected = isImgSelected[index].value;
  }

  clearForm(int index){
    imgsAnswerControllers[index].clear();
    //gameRequest?.imgsAnswer.removeAt(index);
    currentLevel.value?.games?.first.imgsAnswer[index].url = null;
  }
  getImage(int index) async {
    XFile? image = await _pickImage();
     imgsAnswerControllers[index].text =(image)?.name??'';
     //gameRequest?.imgsAnswer.add(AImage(index: index, file: File(image!.path)));
    currentLevel.value?.games?.first.imgsAnswer[index].url= image!.path;
  }
  getQImage() async {
    XFile? image = await _pickImage();
    imgController.text =(image)?.name??'';
    currentLevel.value?.games?.first.img = image!.path;
  }

  Future<XFile?> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      // or use ImageSource.camera to capture a new photo

      if (image == null) return null; // User canceled the picker

      return image;
      // File(image.path)
    } catch (e) {
      // Handle the exception
      print("Error picking image: $e");
    }
    return null;
  }

  saveGame() async{
    if (formKey.currentState!.validate()) {
      state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState , message: AppStrings.loading);
      currentLevel.value?.games?.first.question = questionController.text;
      currentLevel.value?.games?.first.successMessage = successMessageController.text;
      currentLevel.value?.games?.first.exerciseId = currentExercise!.uid;
      currentLevel.value?.games?.first.levelId = currentLevel.value!.id;
      currentLevel.value?.games?.first.id = 0 ;
   /*   for(var i=0;i<imgsAnswerControllers.length;i++){
        if(imgsAnswerControllers[i].text.isNotEmpty){
          currentLevel.value?.games?.first.imgsAnswer[i].url =imgsAnswerControllers[i].text;
        }
      }*/
      (await remoteDataSource.updateGameOfLevel(currentExercise!, currentLevel.value!.games!.first)).fold((failure) {
        state.value = ErrorState(StateRendererType.popupErrorState,failure.message);
      }, (r) {
        if(currentLevel.value!.games==null){
          currentLevel.value!.games?.add(r);
       /*   Get.find<ExerciseController>().exercises
              .firstWhere((element) => element.uid==currentLevel.value!.exerciseId)
              .levels?.firstWhere((element) => element.id==currentLevel.value!.id).games?.add(r);*/
        }
        else {
          currentLevel.value!.games![0] = r;
        }
        state.value = SuccessState(StateRendererType.popupSuccessState, 'تمت العملية بنجاح');
      });
    } else {
      state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.invalidData);
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
    if( currentLevel.value?.games?.first.imgsAnswer.isNotEmpty??false){
      return null;
    }
    if (value == null || value.isEmpty) {
      return AppStrings.invalidData;
    } else {
      return null;
    }
  }
}
