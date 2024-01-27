import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/constant/arabic_number_words.dart';

import '../../presentation/admin/exercies_management/model/Exercise.dart';
import '../../presentation/admin/exercies_management/model/level.dart';
import '../../presentation/admin/games_management/model/game.dart';
import '../utils/color_constant.dart';

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


List<Exercise> exercises = [
  // exercise 1
  Exercise(id: 0, title: 'تمرين تعلم السلوك',color:ColorConstant.appColor[2] ,levels:[
    Level(id: 0 , title:'تعلم المشاركة', exerciseId: 0, levelScore: 20 , levelNumber: convertToArabicWords('1'), games:[
      Game(question: 'محمد يريد قطعة من الكعك', imgsAnswer:[
        TestImage.hany ,
        TestImage.chicken,
        TestImage.cack
      ],id: 0,exerciseId:0,levelId:0,successMessage:'رائع'),
    ]),
    Level(id: 1 , title:'تعلم أداب الأكل', exerciseId: 0, levelScore: 20 , levelNumber: convertToArabicWords('2'), games:[
      Game(question: 'محمد ياكل واقف ساعد محمد في الجلوس بالضغط على الكرسي', imgsAnswer:[
       ImageConstant.testimge2,
       ImageConstant.testimge3,
       ImageConstant.testimge4
      ],id: 0,exerciseId:0,levelId:0,successMessage:'رائع يجب الجلوس اثناء تناول الطعام'),
    ]),
    Level(id: 2 , title:'تعلم النظافة', exerciseId: 0, levelScore: 20 , levelNumber: convertToArabicWords('3'), games:[
      Game(question: 'ساعد محمد في تفريش اسنانه . سنقوم اولا باخذ الفرشاه',
          img: TestImage.teath,
          imgsAnswer:[
        ImageConstant.testimge2,
        ImageConstant.testimge3,
        TestImage.wachteath
      ],id: 0,exerciseId:0,levelId:0,successMessage:'رائع محمد سعيد الان'),
    ]),
    Level(id: 3 , title:'تعلم الرفق بالحيوان', exerciseId: 0, levelScore: 20 , levelNumber: convertToArabicWords('4'), games:[
      Game(question: 'ساعد محمد في العثور على قطته',
          imgsAnswer:[
            TestImage.dog,
            TestImage.dog2,
            TestImage.cat
          ],id: 0,exerciseId:0,levelId:3,successMessage:'محمد يحب الحيوانات'),
    ]),
    Level(id: 4 , title:'تعلم الوضوء', exerciseId: 0, levelScore: 20 , levelNumber: convertToArabicWords('5'), games:[
      Game(question: 'ساعد محمد في الوضوء لصلاه اولا نقوم بغسل اليدين',
          img: TestImage.water,
          imgsAnswer:[
            TestImage.hand
          ],id: 0,exerciseId:0,levelId:4,successMessage:'احسنت محمد ذاهب الان لصلاه'),
    ]),
  ]) ,
  // exercise 2
  Exercise(id: 1, title: 'تمرين اتخاذ القرار',color:ColorConstant.appColor[3] ,levels:[
    Level(id: 0 , title:'تمرين اتخاذ القرار', exerciseId: 1, levelScore: 20 , levelNumber: convertToArabicWords('1'), games:[
      Game(question: 'محمد يريد الذهاب للحديقة ساعد محمد في اختيار ملابسه', imgsAnswer:[
        TestImage.closes ,
        TestImage.closes2
      ],id: 0,exerciseId:0,levelId:0,successMessage:'رائع محمد سعيد باختيارك'),
    ]),
    Level(id: 1 , title:'تمرين اتخاذ القرار', exerciseId: 1, levelScore: 20 , levelNumber: convertToArabicWords('2'), games:[
      Game(question: 'محمد يرغب بالاكل ماذا عليه ان ياكل تفاح او موز', imgsAnswer:[
        TestImage.banana ,
        TestImage.apple
      ],id: 0,exerciseId:1,levelId:0,successMessage:'رائع محمد يحب التفاح'),
    ]),
    Level(id: 2 , title:'تمرين اتخاذ القرار', exerciseId: 1, levelScore: 20 , levelNumber: convertToArabicWords('3'), games:[
      Game(question: 'محمد يحب الرسم ماذا يرسم منزل او بطة', imgsAnswer:[
        TestImage.house ,
        TestImage.kak
      ],id: 0,exerciseId:1,levelId:0,successMessage:'جميلة محمد يجيد الرسم'),
    ]),
    Level(id: 3 , title:'تمرين اتخاذ القرار', exerciseId: 1, levelScore: 20 , levelNumber: convertToArabicWords('4'), games:[
      Game(question: 'محمد يرغب في تغيير سريره ايهما افضل', imgsAnswer:[
        TestImage.board ,
        TestImage.board2 ,
        TestImage.board3 ,
      ],id: 0,exerciseId:1,levelId:0,successMessage:'رائع محمد سعيد باختيارك'),
    ]),
    Level(id: 3 , title:'تمرين اتخاذ القرار', exerciseId: 1, levelScore: 20 , levelNumber: convertToArabicWords('4'), games:[
      Game(question: 'محمد يرغب في تغيير سريره ايهما افضل', imgsAnswer:[
        TestImage.board ,
        TestImage.board2 ,
        TestImage.board3 ,
      ],id: 0,exerciseId:1,levelId:0,successMessage:'رائع محمد سعيد باختيارك'),
    ]),
  ]) ,
  Exercise(id: 2, title: 'تمرين الصور المتطابقة',color:ColorConstant.appColor[1] ,levels:[
    Level(id: 0 , title:'تمرين الصور المتطابقة', exerciseId: 1, levelScore: 20 , levelNumber: convertToArabicWords('1'), games:[
      Game(question: 'أختر الصور المتشابهة', imgsAnswer:[
        TestImage.felfel ,
        TestImage.hany ,
        TestImage.chicken ,
        TestImage.hany ,
        TestImage.chicken ,
        TestImage.felfel ,
      ],id: 0,exerciseId:0,levelId:0,successMessage:'رائع لقد اجتزت المستوى الاول بنجاح'),
    ]),
  ]) ,

];