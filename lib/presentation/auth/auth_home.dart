import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/utils/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../widgets/auth_background.dart';

class AuthHome extends StatelessWidget {
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
                      Text(AppStrings.loginOrRegister,style: TextStyle(
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
                        }, child: Text(AppStrings.login),
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
                        }, child: Text(AppStrings.register),
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
