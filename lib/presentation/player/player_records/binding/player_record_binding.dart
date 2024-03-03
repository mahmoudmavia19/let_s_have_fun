import '../../../../core/app_export.dart';
import '../controller/play_history_user_controller.dart';

class PlayerRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerRecordsController());
  }
}