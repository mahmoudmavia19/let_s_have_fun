import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';

import '../core/utils/app_strings.dart';

class SuccessDialog extends Dialog {
  String title ;

  SuccessDialog({required this.title});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstant.success_kids,
            width:314 ,
            height:161 ,),
            SizedBox(height: 20.0,),
            Text(title, style: TextStyle(color: Colors.red ,fontSize: 20.0 ),)
          ]
        ),
      ),
    );
  }
}