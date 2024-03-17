
import '../../../../core/app_export.dart';
import '../controller/admin_perview_controller.dart';

class AdminPerViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminPerViewController());
  }
}