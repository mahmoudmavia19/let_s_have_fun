// play_history_controller.dart
import 'package:get/get.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/model/user.dart';

 import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/state_renderer/state_renderer.dart';
import '../../../../core/utils/state_renderer/state_renderer_impl.dart';
import '../../../../data/models/player.dart';
import '../../../../data/remote_data_source/doctor_remote_data_source.dart';
import '../model/play_history.dart';

class PlayHistoryController extends GetxController {


  final RxList<PlayHistory> playHistory = <PlayHistory>[].obs;
  final DoctorRemoteDataSource doctorRemoteDataSource = Get.find<DoctorRemoteDataSourceImpl>();
  Rx<FlowState> state = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  Player player = Get.arguments ;
  getPlayHistory() async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState,);
    (await doctorRemoteDataSource.getPlayHistory(player.id!)).fold((failure) {
      state.value = ErrorState(StateRendererType.fullScreenErrorState, failure.message);
    }, (data) {
      playHistory.value = data;
      if(playHistory.isEmpty){
        state.value = EmptyState(AppStrings.noData);
      }else {
        state.value = ContentState();
      }
    });
  }

  @override
  void onInit() {
    getPlayHistory();
     super.onInit();
  }

}
