import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';

import 'level.dart';

class Exercise {
  int id;
  String title;
  List<Level>? levels;
  Color? color;

  Exercise({
    required this.id,
    required this.title,
    this.levels,
    this.color = ColorConstant.primary,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['levels'] = levels;
    return data;
  }

}
