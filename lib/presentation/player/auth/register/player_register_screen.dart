import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/widgets/auth_background.dart';

class PlayerRegisterScreen extends StatelessWidget {
  TextEditingController userTypeController = TextEditingController();
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
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      Text(AppStrings.register,style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )),
                    _buildTextField(AppStrings.name),
                    _buildTextField(AppStrings.phone),
                    _buildTextField(AppStrings.email),
                      _buildTextField(AppStrings.age),
                      _buildTextField(AppStrings.gender),
                      _buildDrawDownField(AppStrings.userType,controller: userTypeController),
                  Obx(() =>Visibility(
                        child:  _buildTextField(AppStrings.certificate,onTap: () async{
                          print('object');
                          var picker = ImagePicker();
                          final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                        },),
                    visible: isDoctor.value),
                  ),
                    _buildTextField(AppStrings.password),
                    _buildTextField(AppStrings.confirmPassword),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      width:  double.maxFinite,
                      child: ElevatedButton(onPressed: () {
                       if(userTypeController.text.contains(AppStrings.theDoctor)){
                         Get.toNamed(AppRoutes.showAllChildrenDoctors);
                       } else {
                         Get.toNamed(AppRoutes.exercisesScreen);
                       }
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
              readOnly: onTap!=null?true:false,
              controller: controller,
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
  _buildDrawDownField(String title , {TextEditingController? controller}) {
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
              items: <String>[AppStrings.player,AppStrings.theDoctor].map((String value) {
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
