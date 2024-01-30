import 'package:flutter/material.dart';
 import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/level.dart';
import 'package:let_s_have_fun/presentation/another_screen/play_area.dart';
import 'package:let_s_have_fun/widgets/message_card.dart';

import '../../core/utils/app_strings.dart';


class AdminPerView extends StatelessWidget {
 Level level;
 Color color ;

 AdminPerView({required this.level,required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                               child:MessageCard('محمد ياكل واقف ساعد محمد في الجلوس بالضغط على الكرسي'),
                             ),
                           ),
                         ],
                       )
                   ),
                   Image.asset(ImageConstant.testimg,width: 100,height: 200,),
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
                       itemCount: 3,// level.game?.imgsAnswer?.length,
                       itemBuilder: (context, index) {
                         //return Image.asset(level.game?.imgsAnswer?[index]??'');
                        return  InkWell(
                          onTap: () {
                            print('object');
                          },
                          child: Container(
                            width: 97,
                            height: 90,
                            padding: EdgeInsets.all(2),
                            child: Image.asset([ImageConstant.testimge2,ImageConstant.testimge3,ImageConstant.testimge4][index],),
                            decoration: BoxDecoration(
                                color: Color(0xFFE3E3E3),
                              borderRadius: BorderRadius.circular(15.0)
                            ),

                          ),
                        );
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
