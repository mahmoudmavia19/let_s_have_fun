import '../../../../core/app_export.dart';
import '../controller/player_doctors_controller.dart';

class PlayerDoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerDoctorsController());
  }
}