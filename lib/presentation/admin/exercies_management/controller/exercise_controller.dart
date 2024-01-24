import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';

 import '../../../../core/app_export.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/utils/state_renderer/state_renderer_impl.dart';
import '../model/Exercise.dart';
import '../model/level.dart';

class ExerciseController extends GetxController {
  var exercises = <Exercise>[].obs;
  var levels = <Level>[].obs;
  Rx<FlowState> state = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

  checkState() {
    state.value = exercises.isEmpty ? ErrorState(StateRendererType.fullScreenErrorState, ''): ContentState();
  }

  @override
  void onInit() {
    super.onInit();
    exercises.add(
        Exercise(
            title:'تمرين تعلم السلوك',
            id: exercises.length,
            color: ColorConstant.appColor[0]
        ),
    );
    levels.add(Level(id: levels.length, title:'تعلم أداب الأكل',
        levelNumber: convertToArabicWords((levels.length+1).toString()),
        exerciseId: 0,levelScore: int.parse('50')));
    checkState();
  }
  void deleteExercise(int id) {
    exercises.removeWhere((element) => element.id==id);
    levels.removeWhere((element) => element.exerciseId==id);
    if(exercises.isEmpty)
      {
        checkState();
      }else {
      state = Rx<FlowState>(SuccessState(StateRendererType.popupSuccessState, AppStrings.successDeleted));
    }
  }
  deleteLevel(int id){
    levels.removeWhere((element) => element.id==id);
    state = Rx<FlowState>(SuccessState(StateRendererType.popupSuccessState, AppStrings.successDeleted));
  }

  Future<void> showAddExerciseDialog() async {
    TextEditingController titleController = TextEditingController();
    Rx<Color?> color  = ColorConstant.appColor[0].obs;
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
                if(p0!.isEmpty){
                  return AppStrings.title;
                }
                return  null;
              }
            ),
           DropdownButtonFormField<Color>(
              value: color.value,
              iconEnabledColor:color.value,
                decoration: InputDecoration(labelText: AppStrings.chooseColor),
                validator: (p0) {
                  if(p0==null){
                    return AppStrings.chooseColor;
                  }
                  return null;
                },
                items:ColorConstant.appColor.map((e) => DropdownMenuItem(
                  onTap: () {
                    color.value = e;
                  },
                  value: e,
                  child:Container(
                  height: 30,
                  color: e,),
                )).toList(), onChanged: (Color? value) {

           },
              ),
            Obx(()=> Container(
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
            if(formKey.currentState!.validate()) {
              exercises.add(
              Exercise(
                title: titleController.text,
                id: exercises.length,
                color: color.value
              )
            );
            state.value = SuccessState(StateRendererType.popupSuccessState, 'تمت الاضافة بنجاح');
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
        child: Column(
          children: [
            TextFormField(
              controller: levelController,
              decoration: InputDecoration(labelText: AppStrings.title),
              validator: (p0) {
                if(p0!.isEmpty){
                  return AppStrings.title;
                }
              },
            ),
            TextFormField(
              controller: levelScoreController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: AppStrings.levelScore),
              validator: (p0) {
                if(p0!.isEmpty){
                  return AppStrings.levelScore;
                }
              }
            ),
          ]
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if(formKey.currentState!.validate()){
             levels.add(Level(id: levels.length, title: levelController.text ,
                 levelNumber: convertToArabicWords((levels.length+1).toString()),
                 exerciseId: exercise.id,levelScore: int.parse(levelScoreController.text)));
            state.value = SuccessState(StateRendererType.popupSuccessState, 'تمت الاضافة بنجاح');
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
      ]
    );
  }

}
