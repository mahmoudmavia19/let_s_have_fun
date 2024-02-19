import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';
import 'package:let_s_have_fun/widgets/required_text.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/app_strings.dart';
import 'controller/doctors_controller.dart';

class AddDoctorScreen extends StatelessWidget {
  final DoctorsController controller = Get.put(DoctorsController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Container(),
        title: Text(AppStrings.addDoctor),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Add other Doctor properties text fields here
              _buildTextField(controller.nameController ,controller, AppStrings.name, _validateNotEmpty),
              _buildTextField(controller.emailController,controller, AppStrings.email, _validateEmail,inputType: TextInputType.emailAddress),
              _buildTextField(controller.phoneController,controller, AppStrings.phone, _validatePhone,inputType: TextInputType.phone),
              _buildTextField(controller.professionController,controller, AppStrings.profession, _validateNotEmpty),
              _buildTextField(controller.hospitalController,controller, AppStrings.hospital, _validateNotEmpty),
               _buildTextField(controller.nationalityController,controller, AppStrings.nationality, _validateNotEmpty),
              _buildTextField(controller.ageController,controller, AppStrings.age, _validateAge,inputType: TextInputType.number),
              _buildTextField(controller.yearsOfExperienceController,controller, AppStrings.yearsOfExperience, _validateExperience,inputType: TextInputType.number),
              _buildPasswordField(controller.passwordController,controller, AppStrings.password, _validatePassword),
              _buildPasswordField(controller.confirmPasswordController,controller, AppStrings.confirmPassword, _validateConfirmPassword),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.addDoctor();
                  }
                },
                child: Text(AppStrings.addDoctor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController formController,DoctorsController controller, String label, String? Function(String?)? validator , {TextInputType inputType = TextInputType.text}) {
    return TextFormField(
       keyboardType: inputType,
        decoration: InputDecoration(
          label: RequiredText(label),
        ),
        validator: (value) {
           if(value == null || value.isEmpty){
             return AppStrings.cantEmpty;
           }
           return null;
        },
      
    );
  }

  Widget _buildPasswordField(TextEditingController passController ,DoctorsController controller, String label, String? Function(String?)? validator) {
    return Obx(
          () => TextFormField(
            keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          label: RequiredText(label),
          suffixIcon: IconButton(
            icon: Icon(controller.isPasswordObscured.value ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              controller.isPasswordObscured.toggle();
            },
          ),
        ),
            validator: (value) {
              if(value == null || value.isEmpty){
                return AppStrings.cantEmpty;
              }
              return null;
            },
        obscureText: controller.isPasswordObscured.value,
      ),
    );
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    // Add email validation logic
    return null;
  }

  String? _validatePhone(String? value) {
    // Add phone validation logic
    return null;
  }

  String? _validateAge(String? value) {
    // Add age validation logic
    return null;
  }

  String? _validateExperience(String? value) {
    // Add experience validation logic
    return null;
  }

  String? _validatePassword(String? value) {
    // Add password validation logic
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    // Add confirm password validation logic
    return null;
  }
}