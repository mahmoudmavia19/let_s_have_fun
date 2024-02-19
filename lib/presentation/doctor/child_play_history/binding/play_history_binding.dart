import '../../../../core/app_export.dart';
import '../controller/play_history_controller.dart';

class PlayHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayHistoryController());
  }
}