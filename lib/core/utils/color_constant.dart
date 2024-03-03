import 'package:flutter/material.dart';

class ColorConstant {
  static  Color white= fromHex('#ffffff');
  static  List<Color> appColor = [fromHex('#8DEFEE'),
                                  fromHex('#F7CED8'),
                                  fromHex('#FEED9B'),
                                  fromHex('#C1FAA9'),
                                  fromHex('#7CF0A7'),];
   static  const MaterialColor  primary = MaterialColor(0xFFF7CED8, {
     50: Color.fromRGBO(247, 206, 216, 0.1),
     100: Color.fromRGBO(247, 206, 216, 0.2),
     200: Color.fromRGBO(247, 206, 216, 0.3),
     300: Color.fromRGBO(247, 206, 216, 0.4),
     400: Color.fromRGBO(247, 206, 216, 0.5),
     500: Color.fromRGBO(247, 206, 216, 0.6),
     600: Color.fromRGBO(247, 206, 216, 0.7),
     700: Color.fromRGBO(247, 206, 216, 0.8),
     800: Color.fromRGBO(247, 206, 216, 0.9),
     900: Color.fromRGBO(247, 206, 216, 1.0),

  });
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
