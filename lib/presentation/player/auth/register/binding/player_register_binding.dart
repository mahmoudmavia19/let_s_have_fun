
import 'package:let_s_have_fun/data/apiClient/player_api_client.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';

import '../../../../../core/app_export.dart';
import '../../login/controller/player_login_controller.dart';
import '../controller/player_register_controller.dart';

class PlayerAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerRegisterController());
    Get.lazyPut(() => PlayerRegisterController());
    Get.lazyPut(() => PlayerLoginController());
  }
}