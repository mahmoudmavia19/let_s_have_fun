import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/player/auth/register/controller/player_register_controller.dart';

class PlayerRegisterScreen extends GetWidget<PlayerRegisterController> {

  RxBool isDoctor = false.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.primary,
          title: Text(AppStrings.register),
        ),
        body: Stack(
            fit: StackFit.expand,
            children: [
             Center(
              child: Obx(()=>SingleChildScrollView(
                  child:controller.state.value.getScreenWidget(_body(), (){}) ,
                ),
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

  _body()=>Form(
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
        _buildTextField(AppStrings.age,controller: controller.ageController),
        _buildDrawDownField(AppStrings.gender,<String>['ذكر','انثى'],controller: controller.genderController),
        _buildDrawDownField(AppStrings.userType,<String>[AppStrings.player,AppStrings.theDoctor],controller: controller.userTypeController),
        Obx(() =>Visibility(
            child:  _buildTextField(AppStrings.certificate,onTap: () async{
              print('object');
              var picker = ImagePicker();
              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              controller.certificateController.text = image!.path;
            },controller: controller.certificateController),
            visible: isDoctor.value),
        ),
        _buildTextField(AppStrings.password,controller: controller.passwordController),
        _buildTextField(AppStrings.confirmPassword,controller: controller.confirmPasswordController),
        Container(
          padding: EdgeInsets.all(8.0),
          width:  double.maxFinite,
          child: ElevatedButton(onPressed: () {
            /* if(controller.userTypeController.text.contains(AppStrings.theDoctor)){
                           Get.toNamed(AppRoutes.showAllChildrenDoctors);
                         } else {
                           Get.toNamed(AppRoutes.exercisesScreen);
                         }*/
            controller.register() ;
          }, child: Text(AppStrings.register),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.btnColor,
                  foregroundColor: Colors.white
              )),
        ),
        TextButton(onPressed: () {
          Get.toNamed(AppRoutes.playerLoginScreen);
        }, child: Text(AppStrings.iHaveAccount))
      ],
    ),
  );

  _buildTextField(String title , {TextEditingController? controller,void Function()? onTap }) {
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
              onTap: onTap,
              obscureText: title.toLowerCase().contains('المرور'),
              readOnly: onTap!=null?true:false,
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
               } else {
                 return null;
               }
             }
            ),
          ),
        ],
      ),
    );
  }
  _buildDrawDownField(String title ,List<String> items , {TextEditingController? controller}) {
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
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  return null;
                }
              },
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value, child: Text(value),
                )  ;
              }) .toList(), onChanged: (String? value) {
                controller?.text = value!;
                if(value == AppStrings.theDoctor){
                  isDoctor.value = true;
                } else {
                  isDoctor.value = false;
                }
            },
            ),
          )  ,
        ],
      ),
    );
  }
}
