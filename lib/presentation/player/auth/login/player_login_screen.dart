import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/widgets/auth_background.dart';

import 'controller/player_login_controller.dart';

class PlayerLoginScreen extends GetWidget<PlayerLoginController> {
   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.primary,
          title: Text(AppStrings.login),
        ),
        body: Center(
          child: Obx(()=>SingleChildScrollView(
              child: controller.state.value.getScreenWidget(_body(), (){}),
            ),
          ),
        ) ,
      ),
    );
  }
  _body()=>Form(
    key: controller.formKey,
    child: Column(
      children: [
        Image.asset(ImageConstant.puzzle_logo,width: 100,),
        SizedBox(height: 30.0,),
        Text(AppStrings.login,style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        )),

        _buildTextField(AppStrings.email,controller: controller.emailController),
        _buildTextField(AppStrings.password,controller:  controller.passwordController),
        Container(
          padding: EdgeInsets.all(8.0),
          width:  double.maxFinite,
          child: ElevatedButton(onPressed: () {
            /*    if(emailController.text.contains('admin')){
                        Get.toNamed(AppRoutes.usersManagementAdmin);
                      } else if (emailController.text.contains('player')){
                        Get.toNamed(AppRoutes.exercisesScreen);
                      } else if (emailController.text.contains('doctor')){
                        Get.toNamed(AppRoutes.showAllChildrenDoctors);
                      }else {
                        Get.toNamed(AppRoutes.exercisesScreen);
                      }*/
            controller.login() ;
          }, child: Text(AppStrings.login),
              style: ElevatedButton.styleFrom(
                  backgroundColor:  ColorConstant.btnColor,
                  foregroundColor: Colors.white
              )),
        ),
        TextButton(onPressed: () {
          Get.toNamed(AppRoutes.playerRegisterScreen);
        }, child: Text(AppStrings.iNotHaveAccount))
      ],
    ),
  );

  _buildTextField(String title , {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: TextStyle(
            fontSize: 16,
          )),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
             ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: TextFormField(
              obscureText: title.toLowerCase().contains('المرور'),
              controller: controller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
