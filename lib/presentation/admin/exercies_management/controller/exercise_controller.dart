import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/data/remote_data_source/admin_remote_data_source.dart';

import '../../../../core/app_export.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/utils/state_renderer/state_renderer_impl.dart';
import '../model/Exercise.dart';
import '../model/level.dart';

class ExerciseController extends GetxController {
  var exercises = <Exercise>[].obs;
  //var levels = <Level>[].obs;
  Rx<FlowState> state = Rx<FlowState>(LoadingState(
      stateRendererType: StateRendererType.fullScreenLoadingState));
  AdminRemoteDataSource remoteDataSource =
      Get.find<AdminRemoteDataSourceImpl>();
  checkState() {
    state.value = exercises.isEmpty
        ? ErrorState(StateRendererType.fullScreenErrorState, '')
        : ContentState();
  }

  @override
  void onInit() {
    super.onInit();
    getAllExercies();
   // checkState();
  }

  getAllExercies() async {
    state.value = LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState);
    (await remoteDataSource.getExercies()).fold((l) {
      state.value =
          ErrorState(StateRendererType.fullScreenErrorState, l.message);
    }, (r) {
      print(r);
      exercises.assignAll(r);
      checkState();
     // state.value = ContentState();
    });
  }

  void deleteExercise(Exercise exercise) async {
    state.value =
        LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    (await remoteDataSource.deleteExercies(exercise)).fold((l) {
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r) {
     getAllExercies();
      if (exercises.isEmpty) {
        checkState();
      } else {
        state = Rx<FlowState>(SuccessState(
            StateRendererType.popupSuccessState, AppStrings.successDeleted));
      }
      state.value = SuccessState(
          StateRendererType.popupSuccessState, AppStrings.successDeleted);
    });
  }

  deleteLevel(Exercise exercise,int id) async{
    exercise.levels?.removeWhere((element) => element.id == id);
    (await remoteDataSource.updateLevels(exercise)).fold((l) {
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r) {
      state.value = SuccessState(StateRendererType.popupSuccessState, AppStrings.successDeleted);
    });
  /*  state = Rx<FlowState>(SuccessState(
        StateRendererType.popupSuccessState, AppStrings.successDeleted));*/
  }

  Future<void> showAddExerciseDialog() async {
    TextEditingController titleController = TextEditingController();
    Rx<Color?> color = ColorConstant.appColor[0].obs;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Get.defaultDialog(
      title: AppStrings.addExercise,
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: AppStrings.title),
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return AppStrings.title;
                  }
                  return null;
                }),
            DropdownButtonFormField<Color>(
              value: color.value,
              iconEnabledColor: color.value,
              decoration: InputDecoration(labelText: AppStrings.chooseColor),
              validator: (p0) {
                if (p0 == null) {
                  return AppStrings.chooseColor;
                }
                return null;
              },
              items: ColorConstant.appColor
                  .map((e) => DropdownMenuItem(
                        onTap: () {
                          color.value = e;
                        },
                        value: e,
                        child: Container(
                          height: 30,
                          color: e,
                        ),
                      ))
                  .toList(),
              onChanged: (Color? value) {},
            ),
            Obx(
              () => Container(
                height: 30,
                color: color.value,
              ),
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.back();
              _addExercise(titleController.text, color.value).then((value) {});
            }
          },
          child: Text(AppStrings.add),
        ),
        TextButton(
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: Text(AppStrings.cancel),
        ),
      ],
    );
  }

  Future<void> showAddLevelDialog(Exercise exercise) async {
    TextEditingController levelController = TextEditingController();
    TextEditingController levelScoreController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Get.defaultDialog(
        title: AppStrings.addlevel,
        content: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              controller: levelController,
              decoration: InputDecoration(labelText: AppStrings.title),
              validator: (p0) {
                if (p0!.isEmpty) {
                  return AppStrings.title;
                }
              },
            ),
            TextFormField(
                controller: levelScoreController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: AppStrings.levelScore),
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return AppStrings.levelScore;
                  }
                }),
          ]),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Get.back();
                _addLevel(
                    levelController.text,
                    levelScoreController.text,
                    exercise
                );
              }
            },
            child: Text(AppStrings.add),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(AppStrings.cancel),
          )
        ]);
  }

  Future<void> _addExercise(String text, Color? value) async {
    state.value =
        LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    (await remoteDataSource.addExercies(Exercise(title: text, color: value)))
        .fold((l) {
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r) {
      // exercises.add(r);
      getAllExercies();
      state.value = SuccessState(
          StateRendererType.popupSuccessState, AppStrings.successAdded);
    });
  }

  Future<void> _addLevel(String text, String text2, Exercise exercise) async {
    state.value = LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    exercise.levels!.add(Level(
        id: exercise.levels!.length,
        title: text,
        levelNumber: convertToArabicWords((exercise.levels!.length + 1).toString()),
        exerciseId: exercise.uid!,
        levelScore: int.parse(text2)));
    (await remoteDataSource.updateLevels(exercise)).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r){
      state.value = SuccessState(StateRendererType.popupSuccessState, AppStrings.successAdded,);

    });
  }


}
