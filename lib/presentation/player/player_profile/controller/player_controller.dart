import 'package:flutter/cupertino.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';

class PlayerController extends GetxController {


  Rx<FlowState> flowState = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  PlayerRemoteDataSource remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  Player player = Player();
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  getProfile() async {
    flowState.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
    (await remoteDataSource.getProfile()).fold((failure) {
      flowState.value = ErrorState(StateRendererType.fullScreenErrorState, failure.message);
    }, (data) {
      player = data;
      nameController.text = player.name??'';
      phoneController.text = player.phone??'';
      emailController.text = player.email??'';
      ageController.text = player.age.toString()??'';
      genderController.text = player.gender??'';
      flowState.value = ContentState();
    });
  }
  updateProfile()async{
    if(formKey.currentState!.validate()){
      player.gender = genderController.text;
      player.age = int.parse(ageController.text);
      player.name = nameController.text;
      player.phone = phoneController.text;
      player.email = emailController.text;
   flowState.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
   (await remoteDataSource.updateProfile(player)).fold((failure) {
     flowState.value = ErrorState(StateRendererType.fullScreenErrorState, failure.message);
   }, (data) {
     flowState.value = SuccessState(StateRendererType.popupSuccessState, AppStrings.success);
   });
    }
  }
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }


}