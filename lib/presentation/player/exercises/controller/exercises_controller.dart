
import 'package:let_s_have_fun/data/remote_data_source/player_remote_data_source.dart';
import 'package:let_s_have_fun/presentation/player/player_profile/binding/player_profile_binding.dart';
import 'package:let_s_have_fun/presentation/player/player_profile/controller/player_controller.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/color_constant.dart';
import '../../../doctor/exercies_management/model/Exercise.dart';
import '../../../doctor/exercies_management/model/level.dart';
import '../../../doctor/games_management/model/game.dart';

class ExercisesController extends GetxController {

  RxList<Exercise> exercises  = <Exercise>[].obs;

  PlayerRemoteDataSource remoteDataSource = Get.find<PlayerRemoteDataSourceImpl>();
  PlayerController playerController = Get.find<PlayerController>();

  getExercies()async {
    (await remoteDataSource.getExercies()).fold((l) {
      print(l.message);
    }, (r) {
      exercises.value = r;
    });
  }

  int totalLevelScore(int index) {
    int total = 0;

    // Iterate over exercises from the specified index to the first exercise
    for (int i = index; i >= 0; i--) {
      // Check if levels is not null and not empty
      if (exercises[i].levels != null && exercises[i].levels?.isNotEmpty == true) {
        // Iterate over levels of the current exercise
        for (final level in exercises[i].levels!) {
          // Add the score of each level to the total
          total += level.levelScore;
        }
      }
    }
    print('Total score: $total');
    return total;
  }
  @override
  void onInit() {
    getExercies();
    super.onInit();
  }
}