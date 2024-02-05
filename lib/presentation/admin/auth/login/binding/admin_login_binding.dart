import 'package:let_s_have_fun/data/remote_data_source/admin_remote_data_source.dart';

import '../../../../../core/app_export.dart';
import '../../../../../data/apiClient/admin_api_client.dart';
import '../controller/admin_login_controller.dart';

class AdminLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminApiClient(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => AdminRemoteDataSourceImpl(Get.find(), Get.find()));
    Get.lazyPut(() => AdminLoginController());
  }
}