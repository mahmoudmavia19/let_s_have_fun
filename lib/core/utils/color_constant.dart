import 'package:flutter/material.dart';

class ColorConstant {
  static  Color white= fromHex('#ffffff');
  static Color btnColor = appColor[1];
  static  List<Color> appColor = [fromHex('#00B1E9'),
                                  fromHex('#EF3349'),
                                  fromHex('#FFDB00'),
                                  fromHex('#33CD9E'),
                                  fromHex('#6FCB00'),];
   static  const MaterialColor  primary = MaterialColor(0xFFFE3B3E, {
     50: Color.fromRGBO(254, 59, 62, 0.1),
     100: Color.fromRGBO(254, 59, 62, 0.2),
     200: Color.fromRGBO(254, 59, 62, 0.3),
     300: Color.fromRGBO(254, 59, 62, 0.4),
     400: Color.fromRGBO(254, 59, 62, 0.5),
     500: Color.fromRGBO(254, 59, 62, 0.6),
     600: Color.fromRGBO(254, 59, 62, 0.7),
     700: Color.fromRGBO(254, 59, 62, 0.8),
     800: Color.fromRGBO(254, 59, 62, 0.9),
     900: Color.fromRGBO(254, 59, 62, 1.0),
  });
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
