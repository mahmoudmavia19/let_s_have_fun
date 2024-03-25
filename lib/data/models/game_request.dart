//
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
//
// class GameRequest {
//   int? id;
//   String question;
//   String? successMessage;
//   File? img;
//   List<AImage> imgsAnswer = [
//    AImage(index: 0, file: null),
//    AImage(index: 1, file: null),
//    AImage(index:2, file: null),
//    AImage(index:3, file: null),
//    AImage(index: 4, file: null),
//    AImage(index: 5, file: null),
//   ];
//   int? levelId;
//   String? exerciseId;
//
//   GameRequest({
//     this.id,
//     required this.question,
//      this.img,
//     this.levelId,
//     this.exerciseId,
//     this.successMessage,
//   });
// }
//
// class AImage {
//   int index ;
//   File? file;
//   bool isSelected = false;
//   AImage({required this.index,required this.file , this.isSelected = false});
// }