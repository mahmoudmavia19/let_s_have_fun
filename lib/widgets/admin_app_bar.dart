import 'package:flutter/material.dart';

import '../core/app_export.dart';
import '../core/utils/app_strings.dart';


AppBar adminAppBar (String title)=> AppBar(
  title: Text(title),
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
