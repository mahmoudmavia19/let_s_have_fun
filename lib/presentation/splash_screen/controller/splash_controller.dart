import 'dart:async';

import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/presentation/splash_screen/models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

 @override
  void onInit() {
    Timer (Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.editDoctorsProfile);
    });
    super.onInit();
  }


}
