// add_child_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/controller/child_controller.dart';
import 'package:let_s_have_fun/widgets/required_text.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import '../../admin/users_management/model/user.dart';

class AddChildScreen extends StatelessWidget {
  final ChildController  controller = Get.find<ChildController>();
  Player user = Player();
  String password = "";
  String cPassword = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(AppStrings.addChild),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(()=>controller.addState.value.getScreenWidget(_body(), (){})),
      ),
    );
  }
_body()=>Form(
  key: formKey,
  child: Column(
    children: [
      SizedBox(height: 50.0,),
      _buildTextField(AppStrings.name, (value) => user.name = value),
      _buildTextField(AppStrings.email, (value) => user.email = value,keyboardType: TextInputType.emailAddress),
      _buildTextField(AppStrings.phone, (value) => user.phone = value,keyboardType: TextInputType.phone),
      _buildTextField(AppStrings.address, (value) => user.address = value),
      _buildTextField(AppStrings.age, (value) => user.age = int.parse(value),keyboardType: TextInputType.number),
      _buildTextField(AppStrings.password, (value){
        password = value;
      },keyboardType: TextInputType.visiblePassword),
      _buildTextField(AppStrings.confirmPassword, (value){
        cPassword = value;
      },keyboardType: TextInputType.visiblePassword),
      // Add more fields as needed
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Add logic to add a new child
          if(formKey.currentState!.validate()){
            if(password == cPassword){
              controller.addPlayer(user,password);
            }else {
              Get.snackbar("تنبيه", "كلمة المرور غير متطابقة");
            }
          }
          // Close the screen
        },
        child: Text(AppStrings.addChild),
      ),
    ],
  ),
);
  Widget _buildTextField(String label, Function(String) onChanged,{TextInputType? keyboardType}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType:keyboardType ,
      decoration: InputDecoration(
        label: RequiredText(label),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.cantEmpty;
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
