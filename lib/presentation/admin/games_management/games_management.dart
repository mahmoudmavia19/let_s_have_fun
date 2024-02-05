import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/controller/exercise_controller.dart';
import 'package:let_s_have_fun/presentation/admin/games_management/controller/games_controller.dart';
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
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    children:[
                      for (int i = 0; i < exerciseController.exercises[index].levels!.where((p0) => p0.exerciseId==exerciseController.exercises[index].uid).length; i++)
                        ListTile(
                          leading: Text("${i+1}"),
                          title: Text(AppStrings.level +' '+convertToArabicWords((i+1).toString())!,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(exerciseController.exercises[index].levels!.where((p0) => p0.exerciseId==exerciseController.exercises[index].uid).toList()[i].title, style:  TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              Text(AppStrings.levelScore +':'+exerciseController.exercises[index].levels!.where((p0) => p0.exerciseId==exerciseController.exercises[index].uid).toList()[i].levelScore.toString() , style:  TextStyle(fontSize: 14),),
                            ],
                          ),
                          onTap: () {
                            controller.getLevel(exerciseController.exercises[index],exerciseController.exercises[index].levels![i]) ;
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
        floatingActionButton: controller.currentLevel.value == null ?
        Builder(
          builder: (innerContext) {
            return FloatingActionButton(
              onPressed: (){
                // Get.to(PlayArea(controller.color!));
                Scaffold.of(innerContext).openEndDrawer();
              },
              child:Text(AppStrings.chooseLevel,textAlign: TextAlign.center,),
            );
          }
        ): controller.currentLevel.value?.games !=null ?  FloatingActionButton(
          onPressed: (){
           // Get.to(PlayArea(controller.color!));
            Get.toNamed(AppRoutes.perViewAdmin,arguments: [
              controller.currentLevel.value,
              controller.color
            ]);
          },
          child: Icon(Icons.slideshow_sharp),
        ):Container(),
      ),
    );
  }

  _widget()=>SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: controller.questionController,
            decoration: InputDecoration(label:RequiredText( AppStrings.question)),
            validator: controller.validate,
          ),
          SizedBox(height: 16.0),
          TextFormField(
            onTap: () {
              controller.getQImage();
            },
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
              validator: controller.validateList,
              decoration: InputDecoration(
                  label:Text(AppStrings.imgUrl+' '+ convertToArabicWords('${i+1}')!),
                  suffixIcon:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.cloud_upload),
                      IconButton(onPressed: (){
                        controller.imgsAnswerControllers[i].clear();
                        controller.isImgSelected[i].value = false ;
                        controller. currentLevel.value?.games?.first.imgsAnswer[i].isSelected =false;
                        controller. currentLevel.value?.games?.first.imgsAnswer[i].url = null;
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
              validator: controller.validate,
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
    ),
  );
}
