import 'package:let_s_have_fun/presentation/another_screen/switch_user_screen.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/add_child_screen.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/binding/child_binding.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/child_management.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/controller/child_controller.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/add_comments_screen.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/binding/play_history_binding.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/view_user_list.dart';
import 'package:let_s_have_fun/presentation/doctor/edit_profile/edit_profile.dart';
import 'package:let_s_have_fun/presentation/player/games/binding/game_binding.dart';
import 'package:let_s_have_fun/presentation/player/games/game_screen.dart';
import 'package:let_s_have_fun/presentation/player/player_records/binding/player_record_binding.dart';
import 'package:let_s_have_fun/presentation/player/player_records/player_records_screen.dart';
import 'package:let_s_have_fun/presentation/splash_screen/splash_screen.dart';
import 'package:let_s_have_fun/presentation/splash_screen/binding/splash_binding.dart';
import 'package:get/get.dart';

 import '../presentation/admin/admin_perview_screen.dart';
import '../presentation/admin/auth/login/admin_login_screen.dart';
import '../presentation/admin/doctors_mangement/add_doctor_screen.dart';
import '../presentation/admin/doctors_mangement/binding/doctors_binding.dart';
import '../presentation/admin/doctors_mangement/doctors_mangement.dart';
import '../presentation/admin/exercies_management/binding/exercises_binding.dart';
import '../presentation/admin/exercies_management/exercise_management.dart';
import '../presentation/admin/games_management/binding/games_binding.dart';
import '../presentation/admin/games_management/games_management.dart';
import '../presentation/admin/users_management/binding/users_binding.dart';
import '../presentation/admin/users_management/users_management.dart';
import '../presentation/doctor/auth/login/doctor_login_screen.dart';
import '../presentation/doctor/child_play_history/binding/commets_binding.dart';
import '../presentation/doctor/child_play_history/child_play_history_screen.dart';
import '../presentation/player/auth/login/player_login_screen.dart';
import '../presentation/player/auth/register/player_register_screen.dart';
import '../presentation/player/exercises/binding/exercises_binding.dart';
import '../presentation/player/exercises/exercises_screen.dart';
import '../presentation/player/levels/binding/levels_binding.dart';
import '../presentation/player/levels/levels_screen.dart';
import '../presentation/player/player_doctors_screen/binding/player_doctors_binding.dart';
import '../presentation/player/player_doctors_screen/player_doctors_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String initialRoute = '/initialRoute';
  static const String exerciseManagementAdmin = '/admin/exercise_management';
  static const String gamesManagementAdmin = '/admin/games_management';
  static const String perViewAdmin = '/admin/per_view';
  static const String usersManagementAdmin = '/admin/users_management';
  static const String doctorsManagementAdmin  = '/admin/doctors_management';
  static const String addDoctorsManagementAdmin  = '/admin/add_doctors_management';
  // doctors routes
  static const String editDoctorsProfile = '/doctor/edit_doctors_profile';
  static const String showAllChildrenDoctors = '/doctor/show_all_children';
  static const String addChildScreen = '/doctor/add_child_screen';
  static const String playHistoryScreen = '/doctor/play_history_screen';
  static const String commentsScreen = '/doctor/comments_screen';
  static const String viewUserList = '/doctor/view_user_list';
  // player routes
  static const String exercisesScreen = '/player/exercises_screen';
  static const String levelsScreen = '/player/levels_screen';
  static const String gameScreen = '/player/game_screen';
  // auth routes
  static const String playerRegisterScreen = '/auth/player_register_screen';
  static const String playerLoginScreen = '/auth/player_login_screen';
  static const String adminLoginScreen = '/auth/admin_login_screen';
  static const String doctorLoginScreen = '/auth/doctor_login_screen';
  static const String switchUserLoginScreen = '/auth/switch_user_login_screen';
  static const String playerRecords = '/player/player_records';
  static const String playerDoctorsScreen = '/player/player_doctors_screen';






  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ) ,
    GetPage(
      name: exerciseManagementAdmin,
      page: () => ExerciseScreen(),
      bindings: [
        ExerciseBinding(),
      ]
    ),
    GetPage (
      name: gamesManagementAdmin,
      page: () => GamesManagement(),
      binding: GamesBinding(),
    ) ,
    GetPage (
      name: perViewAdmin,
      page: () => AdminPerView(level:Get.arguments[0] ,color:Get.arguments[1]),
    ),
    GetPage (
      name: usersManagementAdmin,
      page: () => UsersManagementScreen(),
      binding: UsersBinding(),
    ),
    GetPage (
      name: doctorsManagementAdmin,
      page: () => ShowAllDoctorsScreen(),
      binding: DoctorsBinding(),
    ),
    GetPage (
      name: addDoctorsManagementAdmin,
      page: () => AddDoctorScreen(),
      binding: DoctorsBinding(),
    ),
    GetPage (
      name: editDoctorsProfile,
      page: () => EditProfileScreen(),
      binding: DoctorsBinding(),
    ),
    GetPage (
      name: showAllChildrenDoctors,
      page: () => ShowAllChildrenScreen(),
      binding: ChildBinding(),
    ),
    GetPage (
      name: addChildScreen,
      page: () => AddChildScreen(),
      binding: ChildBinding(),
    ),
    GetPage (
      name: playHistoryScreen,
      page: () => ViewPlayHistoryScreen(childName:Get.arguments,),
      bindings:[
        PlayHistoryBinding(),
      ]
    ),
    GetPage (
      name: commentsScreen,
      page: () => AddCommentsScreen(childName: Get.arguments),
      binding: CommentsBinding(),
    ),
    GetPage (
      name: viewUserList,
      page: () => ShowChildrenList(),
      binding:ChildBinding(),
    ),
    GetPage (
      name: exercisesScreen,
      page: () => ExercisesScreen(),
      binding: ExercisesBinding(),
    ),
    GetPage (
      name: levelsScreen,
      page: () => LevelsScreen(Get.arguments[0]),
      binding: LevelsBinding(),
    ),
    GetPage (
      name: gameScreen,
      page: () => GameScreen(level: Get.arguments[0] , color: Get.arguments[1]),
      binding: GameBinding(),
    ),
    GetPage (
      name: playerRegisterScreen,
      page: () => PlayerRegisterScreen(),
    ),
    GetPage (
      name: playerLoginScreen,
      page: () => PlayerLoginScreen(),
    ),
    GetPage (
      name: adminLoginScreen,
      page: () => AdminLoginScreen(),
    ),
    GetPage (
      name: doctorLoginScreen,
      page: () => DoctorLoginScreen(),
    ),
    GetPage (
      name: switchUserLoginScreen,
      page: () => SwitchUserScreen()
    ),
    GetPage (
      name: playerRecords,
      page: () => PlayerRecords(),
      binding: PlayerRecordBinding(),
    ),
    GetPage(
      name: playerDoctorsScreen,
      page: () => PlayerDoctorsScreen(),
      binding: PlayerDoctorsBinding(),
    )
  ];
}
