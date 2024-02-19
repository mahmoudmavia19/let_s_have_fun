import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/Exercise.dart';

import '../core/utils/image_constant.dart';

class ExercisesItem2 extends StatelessWidget {
  Exercise exercise;

  ExercisesItem2(this.exercise);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.levelsScreen,arguments: [exercise]);
      },
      child: Container(
        height: 160,
         width: 396,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(ImageConstant.child_2png,
                width: 128,
                height: 130,
              ),
            ),
            Positioned(
              top: 12,
              left:95,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 272,
                    height: 55,
                    child: CustomPaint(
                      size: Size(272, 55),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  SizedBox(
                    width: 272,
                    height: 55,
                    child: Center(
                      child: Text(exercise.title,style: TextStyle(
                          fontSize: 24 ,
                          fontWeight: FontWeight.bold ,
                          color: Colors.red,
                        overflow: TextOverflow.ellipsis ,
                      ),textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(0.133698,0);
path_0.lineTo(286.344,0);
path_0.cubicTo(286.344,0,287.145,4.2187,286.344,6.75);
path_0.cubicTo(285.348,9.90012,280.903,10.2195,280.903,13.5);
path_0.cubicTo(280.903,16.7805,286.344,20.25,286.344,20.25);
path_0.cubicTo(286.344,20.25,291.017,23.4995,291.241,26.5);
path_0.cubicTo(291.49,29.8245,286.344,33.75,286.344,33.75);
path_0.cubicTo(286.344,33.75,281.144,36.8822,280.903,40);
path_0.cubicTo(280.637,43.4307,285.379,43.9269,286.344,47.25);
path_0.cubicTo(287.084,49.7969,286.344,54,286.344,54);
path_0.lineTo(0.133698,54);
path_0.lineTo(0.133698,0);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffE3E3E3).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return false;
}
}