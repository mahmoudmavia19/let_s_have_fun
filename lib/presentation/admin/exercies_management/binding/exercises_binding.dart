
import '../../../../core/app_export.dart';
import '../../../../data/apiClient/admin_api_client.dart';
import '../../../../data/remote_data_source/admin_remote_data_source.dart';
import '../controller/exercise_controller.dart';

class ExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminApiClient(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => AdminRemoteDataSourceImpl(Get.find(), Get.find()));
    Get.lazyPut(() => ExerciseController());
  }
}