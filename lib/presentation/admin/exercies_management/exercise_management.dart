import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/widgets/admin_app_bar.dart';
import 'package:let_s_have_fun/widgets/admin_drawer.dart';
import 'package:let_s_have_fun/widgets/doctor_drawer.dart';
import '../../../core/app_export.dart';
import 'controller/exercise_controller.dart';

class ExerciseScreen extends StatelessWidget {
  final ExerciseController exerciseController = Get.put(ExerciseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DoctorDrawer(),
      appBar: adminAppBar(AppStrings.exerciseManagement),
      body: Obx(
          () => exerciseController.state.value.getScreenWidget(_widget(), () {
                exerciseController.checkState();
                print('object');
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          exerciseController.showAddExerciseDialog();
        },
        child: Text(AppStrings.addExercise,style: TextStyle(fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _widget() {
    return ListView.builder(
        itemCount: exerciseController.exercises.length,
        itemBuilder: (context, index) {
          return Obx(
            () => ExpansionTile(
                backgroundColor: exerciseController.exercises[index].color,
                collapsedBackgroundColor:
                    exerciseController.exercises[index].color,
                title: Text(
                  exerciseController.exercises[index].title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          exerciseController.showAddLevelDialog(exerciseController.exercises[index]);
                        },
                          child: Image.asset('assets/images/level_icon.png',width: 23,)),
                    IconButton(
                        onPressed: () {
                          showConfirmDialog(
                              AppStrings.delete, AppStrings.deleteExercise, () {
                            exerciseController.deleteExercise(
                                exerciseController.exercises[index].id);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
                children: [
                  for (int i = 0;
                      i <
                          exerciseController.levels
                              .where((p0) =>
                                  p0.exerciseId ==
                                  exerciseController.exercises[index].id)
                              .length;
                      i++)
                    ListTile(
                      leading: Text("${i + 1}"),
                      title: Text(
                        AppStrings.level +
                            ' ' +
                            convertToArabicWords((i + 1).toString())!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exerciseController.levels
                                .where((p0) =>
                                    p0.exerciseId ==
                                    exerciseController.exercises[index].id)
                                .toList()[i]
                                .title,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppStrings.levelScore +
                                ':' +
                                exerciseController.levels
                                    .where((p0) =>
                                        p0.exerciseId ==
                                        exerciseController.exercises[index].id)
                                    .toList()[i]
                                    .levelScore
                                    .toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            showConfirmDialog(
                                AppStrings.delete, AppStrings.deleteLevel, () {
                              exerciseController.deleteLevel(exerciseController
                                  .levels
                                  .where((p0) =>
                                      p0.exerciseId ==
                                      exerciseController.exercises[index].id)
                                  .toList()[i]
                                  .id);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    )
                ]),
          );
        });
  }




}
