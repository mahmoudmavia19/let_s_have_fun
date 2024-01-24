import '../../../../core/app_export.dart';
import '../controller/doctors_controller.dart';

class DoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorsController());
  }
}