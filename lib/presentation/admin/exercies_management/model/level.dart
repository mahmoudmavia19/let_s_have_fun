import '../../games_management/model/game.dart';

class Level {
  int id;
  String title;
  String? levelNumber;
  String exerciseId;
  int levelScore;
  List<Game>? games;

  Level({
    required this.id,
    required this.title,
    required this.exerciseId,
    required this.levelScore,
    this.games,
    this.levelNumber,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'] as int,
      title: json['title'] as String,
      levelNumber: json['levelNumber'] as String?,
      exerciseId: json['exerciseId'] as String,
      levelScore: json['levelScore'] as int,
      games: (json['games'] as List<dynamic>?)
          ?.map((gameJson) => Game.fromJson(gameJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'levelNumber': levelNumber,
      'exerciseId': exerciseId,
      'levelScore': levelScore,
      'games': games?.map((game) => game.toJson()).toList(),
    };
  }
}
