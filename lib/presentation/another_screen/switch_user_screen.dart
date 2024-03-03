import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/widgets/auth_background.dart';

class SwitchUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: [
              AuthBackground(),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(AppStrings.chooseUser,style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      )),
                      SizedBox(height: 30.0,),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        width:  double.maxFinite,
                        child: ElevatedButton(onPressed: () {
                          Get.toNamed(AppRoutes.playerLoginScreen);
                        }, child: Text(AppStrings.player),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD27893),
                                foregroundColor: Colors.white
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        width:  double.maxFinite,
                        child: ElevatedButton(onPressed: () {
                          Get.toNamed(AppRoutes.adminLoginScreen);
                        }, child: Text(AppStrings.admin),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD27893),
                                foregroundColor: Colors.white
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        width:  double.maxFinite,
                        child: ElevatedButton(onPressed: () {
                          Get.toNamed(AppRoutes.doctorLoginScreen);
                        }, child: Text(AppStrings.theDoctor),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD27893),
                                foregroundColor: Colors.white
                            )),
                      ),

                    ],
                  ),
                ),
              ),
            ]
        ) ,
      ),
    );
  }
 }
