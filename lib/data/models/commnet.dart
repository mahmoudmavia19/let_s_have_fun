class Comment {
  String? uid;
  String? userId;
  String? doctorId;
  String? comment;
  DateTime? date;

  Comment({
    this.uid,
    this.userId,
    this.doctorId,
    this.comment,
    this.date,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userId = json['userId'];
    doctorId = json['doctorId'];
    comment = json['comment'];
    date = json['date'].toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['userId'] = this.userId;
    data['doctorId'] = this.doctorId;
    data['comment'] = this.comment;
    data['date'] = this.date;
    return data;
  }
}