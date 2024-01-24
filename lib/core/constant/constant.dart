import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/constant/arabic_number_words.dart';

String? convertToArabicWords(String number) {

  return arabicNumberWords[number];
}

showConfirmDialog(String title, String content, Function onConfirm) {
  return Get.dialog(AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
            Get.back();
            },
            child: Text('إلغاء'),),
      TextButton(
        onPressed: () {
          onConfirm();
          Get.back();
        },
        child: Text('تأكيد'),
      ),
    ]
  ));
}
