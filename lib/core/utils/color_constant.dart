import 'package:flutter/material.dart';

class ColorConstant {
  static  Color white= fromHex('#ffffff');
  static  List<Color> appColor = [fromHex('#8DEFEE'),
                                  fromHex('#F7CED8'),
                                  fromHex('#FEED9B'),
                                  fromHex('#C1FAA9'),
                                  fromHex('#7CF0A7'),];
   static  const MaterialColor  primary = MaterialColor(0xFF8DEFEE, {
    50: Color.fromRGBO(141, 239, 238, .1),
    100: Color.fromRGBO(141, 239, 238, .2),
    200: Color.fromRGBO(141, 239, 238, .3),
    300: Color.fromRGBO(141, 239, 238, .4),
    400: Color.fromRGBO(141, 239, 238, .5),
    500: Color.fromRGBO(141, 239, 238, .6),
    600: Color.fromRGBO(141, 239, 238, .7),
    700: Color.fromRGBO(141, 239, 238, .8),
    800: Color.fromRGBO(141, 239, 238, .9),
    900: Color.fromRGBO(141, 239, 238, 1),
  });
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
