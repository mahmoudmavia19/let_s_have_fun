import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/player/auth/login/controller/player_login_controller.dart';
import 'package:let_s_have_fun/widgets/auth_background.dart';

class PlayerLoginScreen extends GetWidget<PlayerLoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: [
              AuthBackground(),
              Obx(()=>Center(
                  child: controller.state.value.getScreenWidget(_content(), (){

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

  _content()=> SingleChildScrollView(
    child: Form(
      key: controller.formKey,
      child: Column(
        children: [
          Text(AppStrings.login,style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white
          )),

          _buildTextField(AppStrings.email, controller: controller.emailController),
          _buildTextField(AppStrings.password, controller: controller.passwordController),
          Container(
            padding: EdgeInsets.all(8.0),
            width:  double.maxFinite,
            child: ElevatedButton(onPressed: () {
             controller.login();
            }, child: Text(AppStrings.login),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1E9F9E),
                    foregroundColor: Colors.white
                )),
          ),
          TextButton(onPressed: () {
            Get.toNamed(AppRoutes.playerRegisterScreen);
          }, child: Text(AppStrings.iNotHaveAccount))
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
              validator: (value){
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
