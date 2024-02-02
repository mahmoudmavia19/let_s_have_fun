
import 'package:let_s_have_fun/data/apiClient/doctor_api_client.dart';
import 'package:let_s_have_fun/data/remote_data_source/doctor_remote_data_source.dart';

import '../../../../../core/app_export.dart';
import '../controller/doctor_login_controller.dart';

class DoctorLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorApiClient(Get.find(), Get.find()));
    Get.lazyPut(() => DoctorRemoteDataSourceImpl(Get.find(), Get.find()));
    Get.lazyPut(() => DoctorLoginController());
  }
}