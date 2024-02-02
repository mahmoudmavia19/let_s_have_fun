import 'package:flutter/cupertino.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/state_renderer/state_renderer.dart';
import '../../../../../core/utils/state_renderer/state_renderer_impl.dart';

class PlayerLoginController extends GetxController {
   TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<FlowState> state = Rx(ContentState());

  PlayerRemoteDataSource remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
    if(formKey.currentState!.validate()){
      (await remoteDataSource.signIn(emailController.text, passwordController.text)).fold((l){
        state.value = ErrorState(StateRendererType.popupErrorState,l.message);
      }, (r) {
        state.value = ContentState();
        Get.offAllNamed(AppRoutes.exercisesScreen);
      });
    } else {
      state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.invalidData);
    }
  }




}