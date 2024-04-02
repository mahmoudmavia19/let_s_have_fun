// edit_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/widgets/doctor_drawer.dart';
import '../../../core/utils/app_strings.dart';
import '../../../widgets/required_text.dart';
import 'controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final DoctorEditProfileController controller = Get.put(DoctorEditProfileController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DoctorDrawer(),
      appBar: AppBar(
        title: Text(AppStrings.editProfile),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child:Obx(() =>controller.state.value.getScreenWidget(_body(), (){})),
      ),
      floatingActionButton: Obx(()=> FloatingActionButton(onPressed: (){
        controller.editToggle();
        },
        child:!controller.edit.value?Icon(Icons.edit,): Icon(Icons.edit_off_sharp),
            ),
      ),
    );
  }

  _body()=> Form(
    key: _formKey,
    child: Column(
      children: [
        Obx(
        ()=>Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(radius: 60.0,
                child:controller.photo.value!=null?
                Image.file(controller.photo.value!):
                Image.network(controller.doctor.value.photo??'',),
              ),
              CircleAvatar(
                  backgroundColor:Colors.white,
                  foregroundColor: ColorConstant.primary,
                  child: IconButton(
                    onPressed: () {
                      controller.pickProfileImage();
                    },
                      icon: Icon(Icons.edit,)))
            ],
          ),
        ),
        _buildTextField(controller.nameController , AppStrings.name, _validateNotEmpty),
        _buildTextField(controller.emailController, AppStrings.email, _validateEmail,inputType: TextInputType.emailAddress),
        _buildTextField(controller.phoneController, AppStrings.phone, _validatePhone,inputType: TextInputType.phone),
        _buildTextField(controller.professionController,AppStrings.profession, _validateNotEmpty),
        _buildTextField(controller.hospitalController,AppStrings.hospital, _validateNotEmpty),
        _buildTextField(controller.nationalityController,AppStrings.nationality, _validateNotEmpty),
        _buildTextField(controller.ageController, AppStrings.age, _validateAge,inputType: TextInputType.number),
        _buildTextField(controller.yearsOfExperienceController,AppStrings.yearsOfExperience, _validateExperience,inputType: TextInputType.number),
        SizedBox(height: 20),
        Obx(()=>Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 150,
                child:controller.certificate.value!=null?
                Image.file(controller.certificate.value!):
                Image.network(controller.doctor.value.certificate??'',),
              ),
              CircleAvatar(
                  backgroundColor:Colors.white,
                  foregroundColor: ColorConstant.primary,
                  child: IconButton(
                      onPressed: () {
                        controller.pickCertificateImage();
                      },
                      icon: Icon(Icons.edit,)))
            ],
          ),
        ),
        SizedBox(height: 20),
        Obx(()=> Visibility(
          visible: controller.edit.value,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.updateDoctorProfile();
              }
            },
            child: Text(AppStrings.saveChanges),
          ),
        ),
        ),
      ],
    ),
  );

  Widget _buildTextField(TextEditingController formController, String label, String? Function(String?)? validator , {TextInputType inputType = TextInputType.text}) {
    return Obx(()=> TextFormField(
        keyboardType: inputType,
        controller: formController,
        textInputAction: TextInputAction.next,
        readOnly: !controller.edit.value,
        decoration: InputDecoration(
          label: RequiredText(label),
        ),
        validator: (value) {
          if(value == null || value.isEmpty){
            return AppStrings.cantEmpty;
          }
          return null;
        },

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

}
