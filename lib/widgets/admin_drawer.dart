import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';

import '../core/utils/app_strings.dart';
import '../core/utils/color_constant.dart';

class AdminDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(
            children: [
              DrawerHeader(
                child:Center(
                  child: Text(
                    AppStrings.appTitle,
                    style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: ColorConstant.primary
                ),
              ),
              _tab(AppStrings.exerciseManagement,(){
                Get.toNamed(AppRoutes.exerciseManagementAdmin);
              }),
              _tab(AppStrings.gamesManagement,(){
                Get.toNamed(AppRoutes.gamesManagementAdmin);
              }),
              _tab(AppStrings.userManagement,(){
                Get.toNamed(AppRoutes.usersManagementAdmin);
              }),
              _tab(AppStrings.doctorsManagement,(){
                Get.toNamed(AppRoutes.doctorsManagementAdmin);
              }),

            ]
        ),
    );
  }
  _tab(title,action){
    return  Column(
      children: [
        ListTile(
          title: Text(title,
            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
          onTap: action,
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider()
      ],
    );
  }
}
