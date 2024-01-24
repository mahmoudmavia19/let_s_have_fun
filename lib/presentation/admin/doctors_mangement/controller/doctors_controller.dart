import 'package:flutter/cupertino.dart';

import '../../../../core/app_export.dart';
import '../model/doctor.dart';

class DoctorsController extends GetxController {
  final RxBool isPasswordObscured = true.obs;

  final RxList<Doctor> doctors = <Doctor>[].obs;
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

  addDoctor() {
    if(passwordController.text == confirmPasswordController.text){
    doctors.add(Doctor(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      profession: professionController.text,
      hospital: hospitalController.text,
      photo: photoController.text,
      nationality: nationalityController.text,
      age: int.parse(ageController.text),
      yearsOfExperience: int.parse(yearsOfExperienceController.text),
    ));
    } else {
      Get.snackbar("خطأ", "كلمة المرور غير متطابقة");
    }
  }

  @override
  void onInit() {
    // Initialize the list of doctors (you might fetch it from a data source)
    doctors.assignAll([
      Doctor(
        name: "د.اسم الدكتور",
        email: "test.doctor@example.com",
        phone: "053-456-7890",
        profession: "دكتور نفسي",
        hospital: "مستشفى العام",
        photo: "https://example.com/ahmed_ali.jpg",
        nationality: "سعودي",
        age: 45,
        yearsOfExperience: 20,
      ),
      // Add more doctors with Arabic data as needed
    ]);

    super.onInit();
  }
}