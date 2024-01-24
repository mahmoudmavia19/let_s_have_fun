import 'package:let_s_have_fun/presentation/splash_screen/splash_screen.dart';
import 'package:let_s_have_fun/presentation/splash_screen/binding/splash_binding.dart';
import 'package:get/get.dart';

 import '../presentation/admin/admin_perview_screen.dart';
import '../presentation/admin/doctors_mangement/add_doctor_screen.dart';
import '../presentation/admin/doctors_mangement/binding/doctors_binding.dart';
import '../presentation/admin/doctors_mangement/doctors_mangement.dart';
import '../presentation/admin/exercies_management/binding/exercises_binding.dart';
import '../presentation/admin/exercies_management/exercise_management.dart';
import '../presentation/admin/games_management/binding/games_binding.dart';
import '../presentation/admin/games_management/games_management.dart';
import '../presentation/admin/users_management/binding/users_binding.dart';
import '../presentation/admin/users_management/users_management.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String initialRoute = '/initialRoute';
  static const String exerciseManagementAdmin = '/admin/exercise_management';
  static const String gamesManagementAdmin = '/admin/games_management';
  static const String perViewAdmin = '/admin/per_view';
  static const String usersManagementAdmin = '/admin/users_management';
  static const String doctorsManagementAdmin  = '/admin/doctors_management';
  static const String addDoctorsManagementAdmin  = '/admin/add_doctors_management';

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
    )
  ];
}
