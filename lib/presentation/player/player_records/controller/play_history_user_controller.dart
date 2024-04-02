import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/state_renderer/state_renderer.dart';
import '../../../doctor/child_play_history/model/play_history.dart';

class PlayerRecordsController extends GetxController {
PlayerRemoteDataSource remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  final RxList<PlayHistory> playHistory = <PlayHistory>[].obs;
  Rx<FlowState> state = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading));

  //total score for range of index from 0 to index
  int totalScore(int index) {
    int total = 0;
    for (int i = 0; i <= index; i++) {
      total += playHistory[i].levelPoints!;
    }
    return total;
  }
  // total time for range of index from 0 to index
  Duration totalTime(int index) {
    Duration total = Duration();
    for (int i = 0; i <= index; i++) {
      total += playHistory[i].playingTime!;
    }
    return total;
  }

  getPlayHistory() async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState, message: AppStrings.loading);
    (await remoteDataSource.getPlayerRecords()).fold((failure) {
      state.value = ErrorState(StateRendererType.fullScreenErrorState, failure.message);
    }, (data) {
      for(var item in data){
        playHistory.add(PlayHistory(
          childId: item.userId,
          levelNumber: item.levelId!+1,
          levelPoints: item.score,
          stageNumber: item.recount,
          playingTime:item.time,
        ));
        print(item.time?.inSeconds);
      }
      state.value = ContentState();
    });
  }
  @override
  void onInit() {
    getPlayHistory();
     super.onInit();
  }

}