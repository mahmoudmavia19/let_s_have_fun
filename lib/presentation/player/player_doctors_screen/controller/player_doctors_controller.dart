import '../../../../core/app_export.dart';
import '../../../admin/doctors_mangement/model/doctor.dart';

class PlayerDoctorsController extends GetxController {
  final RxList<Doctor> doctors = <Doctor>[].obs;

@override
  void onInit() {
    super.onInit();
    doctors.assignAll([
      Doctor(
        name: "د.اسم الاخصائي",
        email: "test.sp@example.com",
        phone: "053-456-7890",
        profession: "اخصائي نفسي",
        hospital: "مستشفى العام",
        photo: "https://example.com/ahmed_ali.jpg",
        nationality: "سعودي",
        age: 45,
        yearsOfExperience: 20,
      ),
      // Add more doctors with Arabic data as needed
    ]);
  }
}