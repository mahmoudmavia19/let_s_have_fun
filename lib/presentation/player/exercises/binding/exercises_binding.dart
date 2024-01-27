import '../../../../core/app_export.dart';
import '../controller/exercises_controller.dart';

class ExercisesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExercisesController());
  }
}