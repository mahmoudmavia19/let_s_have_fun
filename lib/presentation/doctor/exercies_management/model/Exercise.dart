import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';

import 'level.dart';

class Exercise {
    int id = 0;
  String? uid;
  late String title;
  List<Level>? levels;
  Color? color;
  String? doctorId;

  Exercise({
    this.id = 0,
      this.uid,
    required this.title,
    this.levels =const[],
    this.color = ColorConstant.primary,
    this.doctorId
  });

   Exercise.fromJson(Map<String, dynamic> json) {
     uid = json['uid'];
    title = json['title'];
    levels = (json['levels']as List?)?.map((e) => Level.fromJson(e)).toList();
    color= Color(json['color']);
    doctorId = json['doctorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['title'] = title;
    data['levels'] = levels;
    data['color'] = color?.value;
    data['doctorId'] = doctorId;
    return data;
  }

}
