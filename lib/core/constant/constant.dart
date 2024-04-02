import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/constant/arabic_number_words.dart';

String? convertToArabicWords(String number) {

  return arabicNumberWords[number];
}

void nullVoid(){}
bool isEmailValid(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
  ).hasMatch(email);
}

bool isPasswordValid(String password) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);
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
  final Duration remainingMinutes = duration - hours;
  final Duration minutes = Duration(minutes: remainingMinutes.inMinutes);
  final Duration remainingSeconds = remainingMinutes - minutes;

  final String formattedHours = hours.inHours > 0
      ? '${Intl.plural(
    hours.inHours,
    one: '${hours.inHours} ساعة',
    few: '${hours.inHours} ساعات',
    other: '${hours.inHours} ساعة',
    locale: locale,
  )} '
      : '';

  final String formattedMinutes = minutes.inMinutes > 0
      ? '${Intl.plural(
    minutes.inMinutes,
    one: '${minutes.inMinutes} دقيقة',
    few: '${minutes.inMinutes} دقائق',
    other: '${minutes.inMinutes} دقيقة',
    locale: locale,
  )} '
      : '';

  final String formattedSeconds = remainingSeconds.inSeconds > 0
      ? '${Intl.plural(
    remainingSeconds.inSeconds,
    one: '${remainingSeconds.inSeconds} ثانية',
    few: '${remainingSeconds.inSeconds} ثواني',
    other: '${remainingSeconds.inSeconds} ثانية',
    locale: locale,
  )} '
      : '';

  return '$formattedHours$formattedMinutes$formattedSeconds';
}