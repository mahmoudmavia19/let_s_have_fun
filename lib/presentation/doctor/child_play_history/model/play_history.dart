// play_history.dart
class PlayHistory {
  final int childId;
  final int levelNumber;
  final int levelPoints;
  final int stageNumber;
  final Duration playingTime;

  PlayHistory({
    required this.childId,
    required this.levelNumber,
    required this.levelPoints,
    required this.stageNumber,
    required this.playingTime,
  });
}
