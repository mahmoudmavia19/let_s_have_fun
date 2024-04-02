import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';

import '../presentation/doctor/exercies_management/model/Exercise.dart';


class ExercisesItem extends StatelessWidget {
  Exercise exercise;
  bool isOpen = false;
  ExercisesItem(this.exercise, {this.isOpen = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:isOpen?() {
        Get.toNamed(AppRoutes.levelsScreen,arguments: [exercise]);
      }:null,
      child: Container(
        height: 160,
         width: 396,
        child: Stack(
           children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(ImageConstant.child_1png,
                width: 128,
                height: 130,
              ),
            ),
            Positioned(
              top: 17,
              right: 108,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(272, 55),
                    painter: RPSCustomPainter(),
                  ),
                  SizedBox(
                    width: 272,
                    height: 55,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(exercise.title,style: TextStyle(
                              fontSize: 24 ,
                              fontWeight: FontWeight.bold ,
                              color: Colors.red,
                            overflow: TextOverflow.ellipsis
                          ),textAlign: TextAlign.center,),
                        ]),
                  ),
                  Visibility(
                    visible: !isOpen,
                    child: Positioned(
                        bottom: 2,
                        right: 0,
                         child: Icon(Icons.lock)),
                  )
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
path_0.moveTo(271.563,54.5);
path_0.lineTo(4.66406,54.5);
path_0.cubicTo(4.66406,54.5,3.91747,50.2813,4.66406,47.75);
path_0.cubicTo(5.59317,44.5999,9.73816,44.2805,9.73816,41);
path_0.cubicTo(9.73816,37.7195,4.66406,34.25,4.66406,34.25);
path_0.cubicTo(4.66406,34.25,0.306351,31.0005,0.0973492,28);
path_0.cubicTo(-0.134219,24.6755,4.66406,20.75,4.66406,20.75);
path_0.cubicTo(4.66406,20.75,9.51316,17.6178,9.73816,14.5);
path_0.cubicTo(9.98573,11.0693,5.5638,10.5731,4.66406,7.25);
path_0.cubicTo(3.97446,4.70305,4.66406,0.5,4.66406,0.5);
path_0.lineTo(271.563,0.5);
path_0.lineTo(271.563,54.5);
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