class Game {
  int? id;
  String question;
  String? successMessage;
  String? img;
  List<AImageGame> imgsAnswer = [
    AImageGame(index: 0, url: null, isSelected: false),
    AImageGame(index: 1, url: null, isSelected: false),
    AImageGame(index: 2, url: null, isSelected: false),
    AImageGame(index: 3, url: null, isSelected: false),
    AImageGame(index: 4, url: null, isSelected: false),
    AImageGame(index: 5, url: null, isSelected: false),
  ];
  int? levelId;
  String? exerciseId;

  Game({
    this.id,
    required this.question,
     this.img,
    this.levelId,
    this.exerciseId,
    this.successMessage,
  });

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        img = json['img'],
        imgsAnswer = List<dynamic>.from(json['imgsAnswer']).map((e) => AImageGame.fromJson(e)).toList(),
        levelId = json['levelId'],
        exerciseId = json['exerciseId'],
        successMessage = json['successMessage'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'question': question,
      'img': img,
      'imgsAnswer': imgsAnswer.map((e) => e.toJson()).toList(),
      'levelId': levelId,
      'exerciseId': exerciseId,
      'successMessage': successMessage,
    };
    return data;
  }
}

class AImageGame {
  late int index;
  late String? url;
   bool isSelected = false;
  AImageGame({required this.index,this.url, required this.isSelected});
  toJson() {
    return {
      'index': index,
      'url': url,
      'isSelected': isSelected
    };
  }
  AImageGame.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    url = json['url'];
    isSelected = json['isSelected'];
  }
}