import '../../../../core/app_export.dart';
import '../../../../data/apiClient/admin_api_client.dart';
import '../../../../data/remote_data_source/admin_remote_data_source.dart';
 import '../controller/doctors_controller.dart';

class DoctorsBinding extends Bindings {
  @override
  void dependencies() {
  /*  Get.lazyPut(() => AdminApiClient(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => AdminRemoteDataSourceImpl(Get.find(), Get.find()));*/
    Get.lazyPut(() => DoctorsController());
  }
}