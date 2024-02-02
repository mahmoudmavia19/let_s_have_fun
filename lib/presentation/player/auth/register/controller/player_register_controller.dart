
import 'package:flutter/cupertino.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/state_renderer/state_renderer_impl.dart';

class PlayerRegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  PlayerRemoteDataSource remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<FlowState> state = Rx(ContentState());


  void register() async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
    if(formKey.currentState!.validate()){

      if(passwordController.text == confirmPasswordController.text){
       if(isEmailValid(emailController.text)){
         if(isPasswordValid(passwordController.text)){
           (await remoteDataSource.signUp(Player(
             name: nameController.text,
             phone: phoneController.text,
             email: emailController.text,
           ),
               passwordController.text
           )).fold((l){
             state.value = ErrorState(StateRendererType.popupErrorState,l.message);
           }, (r) {
             state.value = ContentState();
             Get.offAllNamed(AppRoutes.exercisesScreen);
           });
         } else {
           state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.passwordNotValid);
         }
       } else {
         state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.invalidEmail);
       }
      } else {
        state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.passwordNotMatch);
      }
    } else {
      state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.invalidData);
    }

  }
}