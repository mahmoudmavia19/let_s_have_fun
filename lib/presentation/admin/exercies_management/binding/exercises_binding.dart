
import '../../../../core/app_export.dart';
import '../controller/exercise_controller.dart';

class ExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseController());
  }
}