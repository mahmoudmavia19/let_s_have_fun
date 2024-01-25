// play_history_controller.dart
import 'package:get/get.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/model/user.dart';

 import '../model/play_history.dart';

class PlayHistoryController extends GetxController {

  final RxList<Child> users = <Child>[].obs;

  final RxList<PlayHistory> playHistory = <PlayHistory>[
    PlayHistory(
      childId: 0,
      levelNumber: 1,
      levelPoints: 100,
      stageNumber: 1,
      playingTime:Duration(hours: 1, minutes: 30),
    ),
    PlayHistory(
      childId: 1,
      levelNumber: 2,
      levelPoints: 150,
      stageNumber: 2,
      playingTime:Duration(hours: 1, minutes: 30),
    ),
  ].obs;

  @override
  void onInit() {
    users.assignAll([
      Child(
        name: "اسم المستخدم",
        email: "test1@email.com",
        phone: "053-456-7890",
        address: "الشارع الرئيسي، المدينة",
        age: 28,
        level: 3,
        score: 150,
        regameCount: 7,
        gameTime: Duration(hours: 3, minutes: 30),
        image: "https://example.com/ahmed.jpg", comments: '',
      ),
      Child(
        name: "اسم المستخدم2",
        email: "test2@email.com",
        phone: "057-654-3210",
        address: "شارع النخيل، القرية",
        age: 25,
        level: 2,
        score: 120,
        regameCount: 5,
        gameTime: Duration(hours: 5, minutes: 30),
        image: "https://example.com/fatma.jpg", comments: '',
      ),
      // Add more users as needed
    ]);
    super.onInit();
  }

}
