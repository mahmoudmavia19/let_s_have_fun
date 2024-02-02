
import '../../../../../core/app_export.dart';
import '../../../../../data/apiClient/player_api_client.dart';
import '../../../../../data/remote_data_source/player_remote_data_source.dart';
import '../controller/player_login_controller.dart';

class PlayerLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerApiClient(Get.find(), Get.find()));
    Get.lazyPut(() => PlayerRemoteDataSourceImpl(Get.find(), Get.find()));

  }
}