import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/presentation/player/player_profile/controller/player_controller.dart';

class PlayerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerController());
  }
}