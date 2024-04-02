import 'package:flutter/material.dart';
 import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import '../presentation/doctor/exercies_management/model/level.dart';
class LevelItem extends StatelessWidget {
  Level level ;
  Color color;
  LevelItem(this.level,this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.gameScreen,arguments: [level,color]);
      },
      child: Container(
          height: 167,
          width: 240,
        padding: EdgeInsets.only(top: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(ImageConstant.level_item, height: 167,
              width: 240, ),
            Positioned(
              top: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppStrings.level + " " +level.levelNumber! , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstant.primary),),
                 ],
              ),
            )
          ],
        )
      ),
    );
  }
}
class LevelItem2 extends StatelessWidget {
  Level level ;
  Color color;

  LevelItem2(this.level,this.color);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.gameScreen,arguments: [level,color]);
      },
      child: Container(
          height: 167,
          width: 240,
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(ImageConstant.level_item2, height: 167,
                width: 240, ),
              Positioned(
                top: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppStrings.level + " " +level.levelNumber! ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstant.primary),),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}