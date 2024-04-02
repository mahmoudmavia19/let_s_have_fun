// comments_controller.dart
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/data/remote_data_source/doctor_remote_data_source.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/model/user.dart';

import '../../../../core/app_export.dart';
import '../../../../data/models/commnet.dart';

class CommentsController extends GetxController {
  final TextEditingController commentsController = TextEditingController();
  Rx<FlowState> state = Rx(ContentState());
  DoctorRemoteDataSource remoteDataSource = Get.find<DoctorRemoteDataSourceImpl>();
  Player user = Get.arguments;
  sendComment()async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await remoteDataSource.sendComment(Comment(
      comment: commentsController.text,
      date: DateTime.now(),
      userId: user.id,
    ))).fold((failure) {
       state.value = ErrorState(
          StateRendererType.fullScreenErrorState,
          failure.message
       );
    }, (r) {
        state.value = SuccessState(StateRendererType.fullScreenSuccessState, 'تم ارسال التعليق بنجاح');
    });
  }

  @override
  void onClose() {
    commentsController.dispose();
    super.onClose();
  }
}
