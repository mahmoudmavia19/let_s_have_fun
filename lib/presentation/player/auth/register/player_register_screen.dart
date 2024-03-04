import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/player/auth/register/controller/player_register_controller.dart';
import 'package:let_s_have_fun/widgets/auth_background.dart';

class PlayerRegisterScreen extends GetWidget<PlayerRegisterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: [
            AuthBackground(),
            Obx(()=> Center(
                child: controller.state.value.getScreenWidget(_content(), (){
                  controller.register();
                })
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_forward_ios)),
              ),
          ]
        ) ,
      ),
    );
  }

  _content()=>SingleChildScrollView(
    child: Form(
      key: controller.formKey,
      child: Column(
        children: [
          Text(AppStrings.register,style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white
          )),
          _buildTextField(AppStrings.name,controller: controller.nameController),
          _buildTextField(AppStrings.phone,controller: controller.phoneController),
          _buildTextField(AppStrings.email,controller: controller.emailController),
          _buildTextField(AppStrings.password,controller: controller.passwordController),
          _buildTextField(AppStrings.confirmPassword,controller: controller.confirmPasswordController),
          Container(
            padding: EdgeInsets.all(8.0),
            width:  double.maxFinite,
            child: ElevatedButton(onPressed: () {
              controller.register();
            }, child: Text(AppStrings.register),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD27893),
                    foregroundColor: Colors.white
                )),
          ),
          TextButton(onPressed: () {
            Get.toNamed(AppRoutes.playerLoginScreen);
          }, child: Text(AppStrings.iHaveAccount))
        ],
      ),
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
              color: ColorConstant.primary.withOpacity(1),
            ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
            child: TextFormField(
              controller: controller,
             validator: (value) {
               if(value!.isEmpty){
                 return AppStrings.invalidData;
               }
               return null;
             },
             textInputAction: TextInputAction.next,
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0),
               ),
             ),
            ),
          ),
        ],
      ),
    );
  }
}
