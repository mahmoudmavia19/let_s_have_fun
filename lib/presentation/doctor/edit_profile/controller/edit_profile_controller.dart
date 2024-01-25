// doctor_edit_profile_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../admin/doctors_mangement/model/doctor.dart';

class DoctorEditProfileController extends GetxController {
  final Rx<Doctor> doctor = Rx<Doctor>(Doctor());
  RxBool edit = false.obs;
  editToggle() {
    edit.value = !edit.value;
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController photoController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController yearsOfExperienceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  updateDoctorProfile() {

  }
 }
