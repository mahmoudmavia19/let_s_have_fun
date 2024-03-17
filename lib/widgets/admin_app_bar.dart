import 'package:flutter/material.dart';

import '../core/app_export.dart';
import '../core/utils/app_strings.dart';


AppBar adminAppBar (String title)=> AppBar(
  title: Row(
    children: [
      Image.asset(ImageConstant.puzzle_logo,width: 50.0,),
      Text(title),
    ],
  ),
  actions: [
    if(Navigator.canPop(Get.context!))
    IconButton(
      onPressed: (){
        Get.back();
      },
      icon: Icon(Icons.arrow_forward_ios),
    )
  ],
);
