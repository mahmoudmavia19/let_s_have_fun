import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/data/remote_data_source/doctor_remote_data_source.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../admin/users_management/model/user.dart';

class ChildController extends GetxController {
  final RxList<Player> users = <Player>[].obs;

  DoctorRemoteDataSource remoteDataSource = Get.find<DoctorRemoteDataSourceImpl>();
  Rx<FlowState> state = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));


  getAllChildren() async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
    (await remoteDataSource.getPlayers()).fold((l) {
      state.value = ErrorState(StateRendererType.popupErrorState,l.message);
    }, (r) {
      users.value = r ;
      if(users.isEmpty){
        state.value = EmptyState('لا يوجد بيانات');
      }else {
        state.value = ContentState();
      }
    });

  }

  addPlayer(Player player,String password)async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
    (await remoteDataSource.addPlayer(player,password)).fold((l) {
      state.value = ErrorState(StateRendererType.popupErrorState,l.message);
    }, (r) async{
      await getAllChildren();
      Get.back();
    });
  }
  @override
  void onInit() {
    getAllChildren();
    super.onInit();
  }




}