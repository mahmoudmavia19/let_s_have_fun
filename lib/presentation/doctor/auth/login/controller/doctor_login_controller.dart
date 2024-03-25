import 'package:flutter/cupertino.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/data/remote_data_source/doctor_remote_data_source.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/state_renderer/state_renderer_impl.dart';

class DoctorLoginController extends GetxController {
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   Rx<FlowState> state = Rx(ContentState());

   DoctorRemoteDataSource remoteDataSource = Get.find<DoctorRemoteDataSourceImpl>();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();


   void login() async{
     state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState,message: AppStrings.loading);
         if(formKey.currentState!.validate()){
           (await remoteDataSource.signIn(emailController.text, passwordController.text)).fold((failure) {
             state.value = ErrorState(StateRendererType.popupErrorState, failure.message);
           }, (data) {
             state.value = ContentState();
             Get.offAllNamed(AppRoutes.showAllChildrenDoctors);
           });
         } else {
           state.value = ErrorState(StateRendererType.popupErrorState, AppStrings.invalidData);
         }
   }


}