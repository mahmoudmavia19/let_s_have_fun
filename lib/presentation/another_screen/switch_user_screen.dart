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
         body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(ImageConstant.puzzle_logo,width: 100,),
                SizedBox(height: 30.0,),
                Text(AppStrings.loginOrRegister,style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,

                )),
                SizedBox(height: 30.0,),
                 Container(
                  padding: EdgeInsets.all(8.0),
                  width:  double.maxFinite,
                  child: ElevatedButton(onPressed: () {
                    Get.toNamed(AppRoutes.playerLoginScreen);
                  }, child: Text(AppStrings.login),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.btnColor,
                          foregroundColor: Colors.white
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width:  double.maxFinite,
                  child: ElevatedButton(onPressed: () {
                    Get.toNamed(AppRoutes.playerRegisterScreen);
                  }, child: Text(AppStrings.register),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.btnColor,
                          foregroundColor: Colors.white
                      )),
                ),

              ],
            ),
          ),
        ) ,
      ),
    );
  }
 }
