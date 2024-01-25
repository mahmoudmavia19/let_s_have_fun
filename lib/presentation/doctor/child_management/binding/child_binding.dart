import '../../../../core/app_export.dart';
import '../controller/child_controller.dart';

class ChildBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChildController());
  }
}