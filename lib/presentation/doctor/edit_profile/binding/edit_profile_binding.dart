import '../../../../core/app_export.dart';
import '../controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorEditProfileController());
  }
}