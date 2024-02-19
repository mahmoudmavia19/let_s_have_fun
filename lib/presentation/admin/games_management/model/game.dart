class Game {
  int? id;
  String? question;
  String? successMessage;
  String? img;
  List<String>? imgsAnswer;
  int? currentIndex;
  int? currentIndex2;
  int? levelId;
  int? exerciseId;

  Game({this.id,required this.question, this.img,required this.imgsAnswer , this.levelId, this.exerciseId,this.successMessage, this.currentIndex,this.currentIndex2});

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    img = json['img'];
    imgsAnswer = json['imgsAnswer'].cast<String>();
    levelId = json['levelId'];
    exerciseId = json['exerciseId'];
    successMessage = json['successMessage'];
  }
  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['img'] = this.img;
    data['imgsAnswer'] = this.imgsAnswer;
    data['levelId'] = this.levelId;
    data['exerciseId'] = this.exerciseId;
    data['successMessage'] = this.successMessage;
    return data;
  }

}
