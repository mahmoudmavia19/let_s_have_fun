import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/level.dart';

import 'dialogs.dart';

class LevelItem extends StatelessWidget {
  Level level ;

  LevelItem(this.level);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.gameScreen);
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
                  Text(level.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstant.primary),),
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
  String title ;

  LevelItem2(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstant.primary),),
                ],
              ),
            )
          ],
        )
    );
  }
}