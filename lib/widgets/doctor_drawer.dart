import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';

import '../core/utils/app_strings.dart';
import '../core/utils/color_constant.dart';

class DoctorDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
          children: [
            DrawerHeader(
              child:Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.appTitle,
                      style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    Text(
                      AppStrings.doctor,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: ColorConstant.primary
              ),
            ),
            _tab(AppStrings.editProfile,(){
              Get.toNamed(AppRoutes.editDoctorsProfile);
            }),
            _tab(AppStrings.addChild,(){
            Get.toNamed(AppRoutes.showAllChildrenDoctors);
            }),
            _tab(AppStrings.childrenRecords,(){
              Get.toNamed(AppRoutes.viewUserList);
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
