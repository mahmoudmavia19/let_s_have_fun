import '../../../../core/app_export.dart';
import '../controller/comments_controller.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommentsController());
  }
}