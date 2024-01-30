import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/app_export.dart';

class PlayArea extends StatelessWidget {
  Color color ;


  PlayArea(this.color);

  @override
  Widget build(BuildContext context) {
    var WIDTH =Get.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  CustomPaint(
        size: Size(WIDTH, (WIDTH*2.483720930232558).toDouble()),
        painter: RPSCustomPainter(color),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -20,
              right:-20,
              child: SvgPicture.asset(ImageConstant.topRightEffect,)
            ),
            Positioned(
              left: -20,
              top: -20,
              child: SvgPicture.asset(ImageConstant.topLeftEffect,)
            ),
            Positioned(
                right: 0,
                top: Get.height*0.3,
                child: SvgPicture.asset(ImageConstant.centerEffect,)
            ),

            Positioned(
                left: 0,
                top: 0,
                child: SvgPicture.asset(ImageConstant.dots_top)
            ),
            Positioned(
                right: 10,
                bottom: 0,
                child: SvgPicture.asset(ImageConstant.dots_bottom)
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: Image.asset(ImageConstant.bottomKidsImgPng,))
          ]
        ),
      ),
    );
  }
}


//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  Color color ;


  RPSCustomPainter(this.color);

  @override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(size.width*0.1456679,size.height*0.2563193);
path_0.cubicTo(size.width*0.08687116,size.height*0.2505478,size.width*0.008715674,size.height*0.2268727,size.width*-0.003843093,size.height*0.2229850);
path_0.cubicTo(size.width*-0.004974233,size.height*0.2226348,size.width*-0.005578070,size.height*0.2221086,size.width*-0.005578070,size.height*0.2215346);
path_0.lineTo(size.width*-0.005578070,size.height*0.001872659);
path_0.cubicTo(size.width*-0.005578070,size.height*0.0008384185,size.width*-0.003495651,0,size.width*-0.0009268814,0);
path_0.lineTo(size.width*0.9976744,0);
path_0.cubicTo(size.width*1.000244,0,size.width*1.002326,size.height*0.0008384045,size.width*1.002326,size.height*0.001872640);
path_0.lineTo(size.width*1.002326,size.height*0.9957397);
path_0.cubicTo(size.width*1.002326,size.height*0.9967697,size.width*1.000244,size.height*0.9976124,size.width*0.9976744,size.height*0.9976124);
path_0.lineTo(size.width*0.2069970,size.height*0.9976124);
path_0.cubicTo(size.width*0.1518758,size.height*1.000169,size.width*0.09968093,size.height*1.000290,size.width*0.06012209,size.height*0.9997191);
path_0.cubicTo(size.width*0.05431209,size.height*0.9996348,size.width*0.05453744,size.height*0.9976124,size.width*0.06035116,size.height*0.9976124);
path_0.lineTo(size.width*0.2069970,size.height*0.9976124);
path_0.cubicTo(size.width*0.3059628,size.height*0.9930150,size.width*0.4143605,size.height*0.9805618,size.width*0.4759884,size.height*0.9501873);
path_0.cubicTo(size.width*0.5150884,size.height*0.9309129,size.width*0.4807558,size.height*0.9006667,size.width*0.5570581,size.height*0.8937285);
path_0.cubicTo(size.width*0.6229837,size.height*0.8877350,size.width*0.4775023,size.height*0.8738951,size.width*0.5425372,size.height*0.8660646);
path_0.cubicTo(size.width*0.5800465,size.height*0.8615478,size.width*0.6377023,size.height*0.8195449,size.width*0.6199744,size.height*0.7864588);
path_0.cubicTo(size.width*0.5873070,size.height*0.7254841,size.width*0.4856698,size.height*0.7802481,size.width*0.4445302,size.height*0.7424213);
path_0.cubicTo(size.width*0.4064395,size.height*0.7073979,size.width*0.3404721,size.height*0.6927388,size.width*0.3404721,size.height*0.6543474);
path_0.cubicTo(size.width*0.3404721,size.height*0.6134251,size.width*0.3955186,size.height*0.5870599,size.width*0.4759884,size.height*0.5707893);
path_0.cubicTo(size.width*0.5122884,size.height*0.5634504,size.width*0.6135140,size.height*0.5582322,size.width*0.6429651,size.height*0.5403024);
path_0.cubicTo(size.width*0.6814814,size.height*0.5168530,size.width*0.6211860,size.height*0.4838165,size.width*0.5885163,size.height*0.4708586);
path_0.cubicTo(size.width*0.5362674,size.height*0.4501367,size.width*0.5507326,size.height*0.4219457,size.width*0.5013977,size.height*0.3997219);
path_0.cubicTo(size.width*0.4607047,size.height*0.3813904,size.width*0.4015047,size.height*0.3890187,size.width*0.3767721,size.height*0.3652828);
path_0.cubicTo(size.width*0.3381488,size.height*0.3282163,size.width*0.5097326,size.height*0.3182406,size.width*0.5013977,size.height*0.2772088);
path_0.cubicTo(size.width*0.4965535,size.height*0.2533549,size.width*0.4893535,size.height*0.2318333,size.width*0.4421093,size.height*0.2224438);
path_0.cubicTo(size.width*0.3767721,size.height*0.2094588,size.width*0.2623047,size.height*0.2677678,size.width*0.1456679,size.height*0.2563193);
path_0.close();
// Base color for the shape
Color baseColor = color.withOpacity(1.0);
    // Darker color for the shadow or depth
    Color depthColor = color.withOpacity(0.9);

    // Gradient for the side surfaces
    final sideGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [baseColor, depthColor],
    ).createShader(Rect.fromPoints(Offset(0, 0), Offset(0, size.height)));

    // Gradient for the top surface
    final topGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [baseColor, depthColor],
    ).createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width, 0)));

    // Apply gradients to the paint objects
    Paint paintTop = Paint()
      ..style = PaintingStyle.fill
      ..shader = topGradient;

    Paint paintSide = Paint()
      ..style = PaintingStyle.fill
      ..shader = sideGradient;

    // Draw the shadow

    // Draw the top surface
    canvas.drawPath(path_0, paintTop);

    // Draw the side surfaces
    canvas.drawPath(path_0, paintSide);
    drawShadow(canvas, path_0, depthColor,10.0, true);

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = color.withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}
  void drawShadow(Canvas canvas, Path path, Color shadowColor, double elevation, bool transparent) {
    canvas.drawShadow(path, shadowColor, elevation, transparent);
  }

  @override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}