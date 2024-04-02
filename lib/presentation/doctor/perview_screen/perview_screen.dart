import 'package:flutter/material.dart';
 import 'package:let_s_have_fun/core/app_export.dart';
 import 'package:let_s_have_fun/presentation/another_screen/play_area.dart';
import 'package:let_s_have_fun/widgets/message_card.dart';

import '../../../core/utils/app_strings.dart';
import '../../../widgets/dialogs.dart';
import '../exercies_management/model/level.dart';
import 'controller/admin_perview_controller.dart';


class AdminPerView extends GetWidget<AdminPerViewController>{
 Level level;
 Color color ;

 AdminPerView({required this.level,required this.color});

 @override
 Widget build(BuildContext context) {
   return  Scaffold(
     body:Center(
       child: SizedBox(
         width: 430,
         height: 1068,
         child: Stack(
           children: [
             PlayArea(color),
             SingleChildScrollView(padding: EdgeInsets.only(top: 100.0),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Container(
                     alignment: Alignment.centerRight,
                     padding: EdgeInsets.only(right: 20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text(level.title,style: TextStyle(
                             fontSize: 24 ,
                             fontWeight: FontWeight.bold ,
                             color: Colors.white
                         ), ),
                         Text(AppStrings.level +' '+(level.levelNumber??''),style: TextStyle(
                             fontSize: 14 ,
                             fontWeight: FontWeight.bold ,
                             color: Colors.white
                         ),),
                       ],
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   Container(
                       height: 195,
                       width: 396,
                       child: Stack(
                         children: [
                           Align(
                             alignment: Alignment.bottomRight,
                             child: Image.asset(ImageConstant.child_1png,
                               width: 128,
                               height: 130,
                             ),
                           ),
                           Align(
                             widthFactor: 1.46,
                             alignment: Alignment.topLeft,
                             child: Container(
                               child:MessageCard(level.games?.first.question??'',() {
                                 controller.speak(level.games?.first.question??'') ;
                               }),
                             ),
                           ),
                         ],
                       )
                   ),
                   if(level.games?.first.img?.isNotEmpty??false)
                     Image.network(level.games!.first.img!,width: 200,height: 200,
                       fit: BoxFit.contain,
                     ),
                   if(level.games?.first.img?.isEmpty??true)
                     SizedBox(height: 20,),
                   Align(
                     alignment: Alignment.center,
                     child: GridView.builder(
                       shrinkWrap: true,
                       padding: EdgeInsets.all(10.0),
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 3,
                         crossAxisSpacing: 10,
                         mainAxisSpacing: 10,
                       ),
                       itemCount:level.games?.first.imgsAnswer.length,// level.game?.imgsAnswer?.length,
                       itemBuilder: (context, index) {
                         //return Image.asset(level.game?.imgsAnswer?[index]??'');
                         if(level.games?.first.imgsAnswer[index].url!=null)
                         return  InkWell(
                           onTap: () {
                             if(level.games?.first.imgsAnswer[index].isSelected??false){
                               controller.speak(level.games?.first.successMessage??'');
                               Get.dialog(
                                   SuccessDialog(title:level.games?.first.successMessage??'',)
                               );
                             }else {
                               Get.dialog(
                                   NotSuccessDialog(title:level.games?.first.successMessage??'',)
                               );
                               controller.speak(AppStrings.notSuccess,);
                             }

                           },
                           child: Container(
                             width: 97,
                             height: 90,
                             padding: EdgeInsets.all(2),
                             child: Image.network(level.games!.first.imgsAnswer[index].url!,),
                             decoration: BoxDecoration(
                                 color: Color(0xFFE3E3E3),
                                 borderRadius: BorderRadius.circular(15.0)
                             ),

                           ),
                         );
                         return Container();
                       },
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
       ),
     ),
   );
 }
}
