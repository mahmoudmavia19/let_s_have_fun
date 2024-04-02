import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
 import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/play_game.dart';
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';
import 'package:let_s_have_fun/presentation/doctor/exercies_management/controller/exercise_controller.dart';
import 'package:let_s_have_fun/presentation/doctor/exercies_management/model/level.dart';
import 'package:let_s_have_fun/presentation/player/exercises/controller/exercises_controller.dart';
import 'package:let_s_have_fun/presentation/player/player_profile/controller/player_controller.dart';

class GameController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  Duration startGame = Duration();
  Rx<FlowState> state = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  PlayerRemoteDataSource remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  @override
  void onInit() {
    super.onInit();
    initTts();
  }
   Level? level = Get.arguments[0];
  onReady() {
    super.onReady();
    startGameTime();
  }
  startGameTime() {
    startGame = Duration();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      startGame = startGame + const Duration(seconds: 1);
      update();
    });
  }


  playGame(isDone) async {
    PlayGame game = PlayGame(
      uid: level?.exerciseId,
      date: DateTime.now(),
      levelId: level?.id,
      exerciseId:  level?.exerciseId,
      isDone: isDone ,
      score: isDone ? level?.levelScore : 0,
      time:  startGame,
    );
    (await remoteDataSource.playGame(game)).fold((failure) {
      state.value = ErrorState(
        StateRendererType.fullScreenErrorState,
        failure.message
      );
    }, (data) async{
      if(game.isDone){
        (await remoteDataSource.updateScore(game, level!)).fold((failure) {
          state.value = ErrorState(
              StateRendererType.fullScreenErrorState,
              failure.message
          );
        }, (data) {
          state.value = ContentState();
        });
      }
      state.value = ContentState();
      Get.find<PlayerController>().getProfile() ;
      Get.find<ExercisesController>().getExercies();
    });
  }

  initTts() async {
    List<dynamic> voices = await flutterTts.getVoices;
    print(voices);


    await flutterTts.setLanguage("ar-SA"); // Arabic Saudi Arabia
    await flutterTts.setVoice({
      "name": "ar-xa-x-arc-network",
      "locale": "ar"
    });
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }


}