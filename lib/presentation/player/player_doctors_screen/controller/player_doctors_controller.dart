import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/commnet.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';

import '../../../../core/app_export.dart';
import '../../../admin/doctors_mangement/model/doctor.dart';

class PlayerDoctorsController extends GetxController {
  final RxList<Doctor> doctors = <Doctor>[].obs;
  PlayerRemoteDataSource  remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  Rx<FlowState> state = Rx(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

 RxList<Comment> comments = <Comment>[].obs;
  getDoctors()async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState,);
    (await remoteDataSource.getDoctorsList()).fold((failure) {
      state.value = ErrorState(StateRendererType.fullScreenErrorState, failure.message);
    }, (data) {
      doctors.value = data;
      state.value = ContentState();
    });
  }

  getComments()async {
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState,);
    (await remoteDataSource.getComments()).fold((failure) {
      state.value = ErrorState(StateRendererType.fullScreenErrorState, failure.message);
    }, (data) {
      comments.value = data;
      print(data.length);
    });
  }
@override
  void onInit() {
  getDoctors();
  getComments();
    super.onInit();
   }
}