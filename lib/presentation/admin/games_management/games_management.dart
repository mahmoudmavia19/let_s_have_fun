import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/controller/exercise_controller.dart';
import 'package:let_s_have_fun/presentation/admin/games_management/controller/games_controller.dart';
import 'package:let_s_have_fun/presentation/another_screen/play_area.dart';
import 'package:let_s_have_fun/widgets/required_text.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_strings.dart';
import '../../../widgets/admin_drawer.dart';

class GamesManagement extends GetWidget<GameController> {
 ExerciseController exerciseController = Get.put(ExerciseController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        endDrawer: Drawer(
          child:exerciseController.exercises.isEmpty ? Container() :  ListView.builder(
              itemCount: exerciseController.exercises.length,
              itemBuilder: (context, index) {
                return Obx(()=> ExpansionTile(
                    backgroundColor:exerciseController.exercises[index].color,
                    collapsedBackgroundColor:exerciseController.exercises[index].color,
                    title:Text(exerciseController.exercises[index].title,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              exerciseController.showAddLevelDialog(exerciseController.exercises[index]);
                            },
                            icon: Icon(Icons.add)),

                        IconButton(
                            onPressed: () {
                              showConfirmDialog(AppStrings.delete, AppStrings.deleteExercise, () {
                                exerciseController.deleteExercise(exerciseController.exercises[index].id);
                              });
                            },
                            icon: Icon(Icons.delete,color: Colors.red ,)),
                      ],
                    ),
                    children:[
                      for (int i = 0; i < exerciseController.levels.where((p0) => p0.exerciseId==exerciseController.exercises[index].id).length; i++)
                        ListTile(
                          leading: Text("${i+1}"),
                          title: Text(AppStrings.level +' '+convertToArabicWords((i+1).toString())!,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(exerciseController.levels.where((p0) => p0.exerciseId==exerciseController.exercises[index].id).toList()[i].title, style:  TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              Text(AppStrings.levelScore +':'+exerciseController.levels.where((p0) => p0.exerciseId==exerciseController.exercises[index].id).toList()[i].levelScore.toString() , style:  TextStyle(fontSize: 14),),
                            ],
                          ),
                          trailing: IconButton(onPressed: (){
                            showConfirmDialog(AppStrings.delete, AppStrings.deleteLevel, () {
                              exerciseController.deleteLevel(exerciseController.levels.where((p0) => p0.exerciseId==exerciseController.exercises[index].id).toList()[i].id);
                            }) ;
                          }, icon: Icon(Icons.delete,color: Colors.red,)),
                          onTap: () {
                            controller.getLevel(exerciseController.levels.where((p0) => p0.exerciseId==exerciseController.exercises[index].id).toList()[i]) ;
                            Get.back();
                          },
                        )
                    ]
                ),
                );
              }
          ),
        ),
        drawer: AdminDrawer(),
        appBar:  AppBar(
          title: Text(AppStrings.gamesManagement),
          actions: [
            Builder(
              builder: (innterContext) {
                return IconButton(onPressed: () {
                  Scaffold.of(innterContext).openEndDrawer();
                }, icon: Icon(Icons.menu_open));
              }
            ),
            if(Navigator.canPop(Get.context!))
              IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.arrow_forward_ios),
              )
          ],
         bottom: Tab(
           child:Visibility(
               visible: controller.currentLevel.value != null,
                 child: Text(controller.currentLevel.value?.title??''),
           ),
         ),
        ),
        body: controller.state.value.getScreenWidget(_widget(), (){}),
        floatingActionButton: Visibility(
          visible: controller.currentLevel.value != null,
          child: FloatingActionButton(
            onPressed: (){
             // Get.to(PlayArea(controller.color!));
              Get.toNamed(AppRoutes.perViewAdmin,arguments: [
                controller.currentLevel.value,
                controller.color
              ]);
            },
            child: Icon(Icons.slideshow_sharp),
          ),
        ),
      ),
    );
  }

  _widget()=>SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: controller.questionController,
          decoration: InputDecoration(label:RequiredText( AppStrings.question)),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          onTap: () {},
          readOnly: true,
          controller: controller.imgController,
          decoration: InputDecoration(
              label:RequiredText( AppStrings.imgUrl),
              suffixIcon: Icon(Icons.upload)
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          child: Row(
            children: [
              Expanded(child: Container(height: 1,color: Colors.grey,)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(AppStrings.answers,style: TextStyle(fontSize: 16.0),),
              ),
              Expanded(child: Container(height: 1,color: Colors.grey,)) ,
            ],
          ),
        ),
        // images
        for(int i=0;i<6;i++)...[
          TextFormField(
            onTap: () {
              print('object');
              controller.getImage(i);
            },
            readOnly: true,
            controller: controller.imgsAnswerControllers[i],
            decoration: InputDecoration(
                label:Text(AppStrings.imgUrl+' '+ convertToArabicWords('${i+1}')!),
                suffixIcon:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cloud_upload),
                    IconButton(onPressed: (){
                      controller.imgsAnswerControllers[i].clear();
                      controller.isImgSelected[i].value = false ;
                    }, icon: Icon(Icons.clear))
                  ],
                ),
                prefixIcon: Obx(()=>Checkbox(
                  value: controller.isImgSelected[i].value,
                  onChanged: (value) {
                    controller.checkImgSelected(i);
                  },
                ),
                )
            ),
          ),
          SizedBox(height: 16.0),
        ],
        TextFormField(
            controller: controller.successMessageController,
            decoration: InputDecoration(
              label:Text(AppStrings.enterSuccessMessage),)
        ),
        ElevatedButton(
          onPressed: () {
            controller.saveGame();
          },
          child: Text(AppStrings.saveGame),
        ),
      ],
    ),
  );
}
