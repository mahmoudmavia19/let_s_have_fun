import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/presentation/player/games/game_screen.dart';
import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: ColorConstant.appColor[0],
            elevation: 1.0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tufuli Arabic DEMO',
              fontSize: 24,
            )
          ),
          primarySwatch: ColorConstant.primary,
          fontFamily: 'Tufuli Arabic DEMO',
          iconTheme: IconThemeData(
            color: Colors.white
          ) ,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: ColorConstant.primary,
          )
        ),
        translations: AppLocalization(),
        locale:Locale('ar', 'AR'), //for setting localization strings
        fallbackLocale: Locale('ar', 'AR'),
        title: 'let_s_have_fun',
        initialBinding: InitialBindings(),
         getPages: AppRoutes.pages,
        initialRoute:AppRoutes.splashScreen ,
      //  home:GameScreen(color:exercises.last.color!,level:exercises.last.levels!.last),
      );
    });
  }
}
