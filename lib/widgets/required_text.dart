import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';

class RequiredText extends StatelessWidget {
  String text;
  TextStyle? style;
  RequiredText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
      Text(AppStrings.reqStar,style: TextStyle(color: Colors.red),),
      Text(text,style: style,)
      ],
    );
  }
}
