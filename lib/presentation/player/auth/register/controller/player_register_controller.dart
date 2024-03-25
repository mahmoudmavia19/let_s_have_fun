
import 'package:flutter/cupertino.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/data/remote_data_source/doctor_remote_data_source.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/state_renderer/state_renderer_impl.dart';

class PlayerRegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController certificateController = TextEditingController();

  PlayerRemoteDataSource remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  DoctorRemoteDataSource remoteDataSourceDoctor = Get.find<DoctorRemoteDataSourceImpl>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<FlowState> state = Rx(ContentState());


  void register() async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
    if(formKey.currentState!.validate()){

      if(passwordController.text == confirmPasswordController.text){
       if(isEmailValid(emailController.text)){
         if(isPasswordValid(passwordController.text)){
           if(userTypeController.text == 'player') {
             (await remoteDataSource.signUp(Player(
               name: nameController.text,
               phone: phoneController.text,
               email: emailController.text,
               age: int.parse(ageController.text),
             ),
                 passwordController.text
             )).fold((l){
               state.value = ErrorState(StateRendererType.popupErrorState,l.message);
             }, (r) {
               state.value = ContentState();
               Get.offAllNamed(AppRoutes.exercisesScreen);
             });
           }else {
             (await remoteDataSourceDoctor.sinUp(Doctor(
               name: nameController.text,
               phone: phoneController.text,
               email: emailController.text,
               certificate: certificateController.text,
               age: int.parse(ageController.text),
             ),
                 passwordController.text
             )).fold((l){
               state.value = ErrorState(StateRendererType.popupErrorState,l.message);
             }, (r) {
               state.value = ContentState();
               Get.offAllNamed(AppRoutes.showAllChildrenDoctors);
             });
           }


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