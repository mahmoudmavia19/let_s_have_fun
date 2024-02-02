
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/data/remote_data_source/admin_remote_data_source.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/state_renderer/state_renderer.dart';
import '../../../../../core/utils/state_renderer/state_renderer_impl.dart';

class AdminLoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<FlowState> state = Rx(ContentState());
  AdminRemoteDataSource remoteDataSource = Get.find<AdminRemoteDataSourceImpl>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState,message: AppStrings.loading);
    if(formKey.currentState!.validate()){
      (await remoteDataSource.signIn(emailController.text, passwordController.text)).fold((failure) {
        state.value = ErrorState(StateRendererType.popupErrorState, failure.message);
      }, (data) {
        state.value = ContentState();
        if(data){
          Get.offAllNamed(AppRoutes.showAllChildrenDoctors);
        } else {
          state.value = ErrorState(StateRendererType.popupErrorState,AppStrings.notAdmin);
        }
      });
    } else {
      state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.invalidData);
    }
  }

}