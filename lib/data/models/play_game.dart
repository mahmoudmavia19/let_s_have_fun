import 'package:cloud_firestore/cloud_firestore.dart';

class PlayGame {
  String? uid;
  String? userId;
  String? exerciseId;
  int? levelId;
  int? score;
  int? recount;
  bool isDone = false;
  DateTime? date;
  Duration? time ;

  PlayGame(
      {this.uid,
      this.userId,
      this.exerciseId,
      this.levelId,
      this.recount,
      this.score,
      this.time,
      this.isDone = false,
      this.date});

  PlayGame.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userId = json['userId'];
    exerciseId = json['exerciseId'];
    levelId = json['levelId'];
    recount = json['recount'];
    isDone = json['isDone'];
    score = json['score'];
    time = Duration(seconds: json['time']);
    date = (json['date']).toDate();
  }
  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['userId'] = this.userId;
    data['exerciseId'] = this.exerciseId;
    data['levelId'] = this.levelId;
    data['recount'] = FieldValue.increment(1);
    data['date'] = this.date;
    data['isDone'] = this.isDone;
    data['score'] = this.score;
    data['time'] = this.time!.inSeconds;
    return data;
  }
}