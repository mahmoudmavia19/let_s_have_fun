import '../../../../core/app_export.dart';
import '../controller/levels_controller.dart';

class LevelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LevelsController());
  }
}