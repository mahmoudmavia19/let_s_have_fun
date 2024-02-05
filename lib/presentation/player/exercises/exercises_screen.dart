import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/level.dart';
import 'package:let_s_have_fun/presentation/another_screen/play_area.dart';
import 'package:let_s_have_fun/widgets/exercises_item.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/exercises_item2.dart';
import '../../../widgets/message_card.dart';

class ExercisesScreen extends StatelessWidget {
  var color = ColorConstant.primary;
  var level = Level(id: 0 , title:' title', exerciseId: '0', levelScore: 0);
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
              Padding(padding: EdgeInsets.only(top: 100.0),
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
                          Text(AppStrings.sections ,style: TextStyle(
                              fontSize: 24 ,
                              fontWeight: FontWeight.bold ,
                              color: Colors.white
                          ), ),
                        ],
                      ),
                    ),
                     Expanded(
                      child: ListView.builder(
                        itemCount:exercises.length ,
                          itemBuilder:(context, index) => index%2==0?ExercisesItem2(exercises[index]):
                          ExercisesItem(exercises[index]), )
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
