import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/player.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../data/remote_data_source/admin_remote_data_source.dart';

class UsersController extends GetxController {

  final AdminRemoteDataSource adminRemoteDataSource = Get.find<AdminRemoteDataSourceImpl>();
  Rx<FlowState> state = Rx(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  List<Player> players = [];
   getPlayers()async{
     state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
     (await adminRemoteDataSource.getPlayers()).fold((l) {
       state.value = ErrorState(StateRendererType.fullScreenErrorState, l.message);
     }, (r) {
       players.assignAll(r);
       if(players.isEmpty){
         state.value = EmptyState(AppStrings.noData);
       } else {
         state.value = ContentState();
       }
     }
     );
   }
   blockPlayer(Player player)async{
     state.value = LoadingState(stateRendererType: StateRendererType.popupLoadingState);
     players[players.indexOf(player)].isBlocked = !player.isBlocked;
     (await adminRemoteDataSource.updatePlayer(player)).fold((l) {
       state.value = ErrorState(StateRendererType.popupErrorState, l.message);
     }, (r) {
        state.value = SuccessState(StateRendererType.popupSuccessState, AppStrings.success);
     });
   }
  @override
  void onInit() {
     getPlayers();
    super.onInit();
  }
}