import '../../games_management/model/game.dart';

class Level {

  int id;
  String title;
  String? levelNumber;
  int exerciseId;
  int levelScore;
  Game? game;
  Level({required this.id,required this.title , required this.exerciseId, required this.levelScore, this.game , this.levelNumber});

}