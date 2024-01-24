import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  String title;

  MessageCard(this.title);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(265, 115),
          painter: RPSCustomPainter(),
        ),
        SizedBox(
          width: 245,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(
                    fontSize: 24 ,
                    fontWeight: FontWeight.bold ,
                    color: Colors.red
                ),textAlign: TextAlign.center,),
              ]),
        )
      ],
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFE3E3E3);

    Path path = Path()
      ..moveTo(285, 114.397)
      ..lineTo(4.81335, 114.397)
      ..cubicTo(4.81335, 114.397, 4.0296, 105.46, 4.81335, 100.097)
      ..cubicTo(5.78873, 93.4241, 14.0595, 92.2456, 14.0595, 85.2961)
      ..cubicTo(14.0595, 78.3465, 7.68622, 77.3137, 4.81335, 71.4982)
      ..cubicTo(2.37775, 66.5678, 0.238708, 64.6143, 0.0192871, 58.2578)
      ..cubicTo(-0.223816, 51.2149, 1.85452, 48.4421, 4.81335, 42.8989)
      ..cubicTo(7.56885, 37.7367, 13.8233, 37.713, 14.0595, 31.108)
      ..cubicTo(14.3195, 23.8402, 5.7579, 21.3395, 4.81335, 14.2996)
      ..cubicTo(4.08945, 8.90402, 4.81335, 1.52588e-05, 4.81335, 1.52588e-05)
      ..lineTo(285, 1.52588e-05)
      ..lineTo(285, 114.397);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
