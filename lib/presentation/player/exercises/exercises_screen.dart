import 'dart:async';
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/level.dart';
import 'package:let_s_have_fun/presentation/another_screen/play_area.dart';
import 'package:let_s_have_fun/widgets/exercises_item.dart';

import '../../../core/utils/app_strings.dart';
 import '../../../widgets/exercises_item2.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  var color = ColorConstant.primary;

  var level = Level(id: 0 , title:' title', exerciseId: 0, levelScore: 0);

  var logo = true.obs ;
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      logo.value = false ;
    });
    super.initState();
  }

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
                          Row(
                            children: [
                              Text(AppStrings.sections ,style: TextStyle(
                                  fontSize: 24 ,
                                  fontWeight: FontWeight.bold ,
                                  color: Colors.white
                              ), ),
                              Spacer() ,
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: GestureDetector(
                                  onTap:() {
                                    Get.toNamed(AppRoutes.playerProfile) ;
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.person_outline_rounded,size: 50.0,
                                      color:Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: GestureDetector(
                                  onTap:() {
                                    Get.toNamed(AppRoutes.playerDoctorsScreen) ;
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.people_outline,size: 50.0,
                                      color:Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: GestureDetector(
                                  onTap:() {
                                    Get.toNamed(AppRoutes.playerRecords) ;
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.history_edu_outlined,size: 50.0,
                                      color:Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
              ),
              Obx(()=>Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: AnimatedAlign(
                    duration: Duration(seconds: 1),
                    alignment:logo.value? Alignment.center : Alignment.topRight,
                      child: AnimatedRotation(
                        turns: logo.value? 0 : 1,
                        duration: Duration(seconds: 1),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: logo.value? 300 : 70,
                            width: logo.value? 300 : 70,
                            child: Image.asset(ImageConstant.puzzle_logo)),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
