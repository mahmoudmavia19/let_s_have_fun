import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
String formatDuration(Duration duration, String locale) {
  if (duration.inMilliseconds < 0) {
    throw ArgumentError('Duration must be non-negative.');
  }

  final Duration hours = Duration(hours: duration.inHours);
  final Duration remaining = duration - hours;

  final String formattedHours = hours.inHours > 0
      ? '${Intl.plural(
    hours.inHours,
    one: '${hours.inHours} ساعة',
    few: '${hours.inHours} ساعات',
    other: '${hours.inHours} ساعة',
    locale: locale,
  )} '
      : '';

  final String formattedMinutes = remaining.inMinutes > 0
      ? '${Intl.plural(
    remaining.inMinutes,
    one: '${remaining.inMinutes} دقيقة',
    few: '${remaining.inMinutes} دقائق',
    other: '${remaining.inMinutes} دقيقة',
    locale: locale,
  )}'
      : '';

  return '$formattedHours$formattedMinutes';
}