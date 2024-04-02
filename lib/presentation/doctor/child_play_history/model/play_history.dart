// play_history.dart
class PlayHistory {
    String? childId;
    int? levelNumber;
    int? levelPoints;
    int? stageNumber;
    Duration? playingTime;

  PlayHistory({
     this.childId,
     this.levelNumber,
     this.levelPoints,
     this.stageNumber,
     this.playingTime,
  });

    PlayHistory.fromJson(Map<String, dynamic> json) {
    childId = json['childId'];
    levelNumber = json['levelNumber'];
    levelPoints = json['levelPoints'];
    stageNumber = json['stageNumber'];
    playingTime = json['playingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['childId'] = this.childId;
    data['levelNumber'] = this.levelNumber;
    data['levelPoints'] = this.levelPoints;
    data['stageNumber'] = this.stageNumber;
    data['playingTime'] = this.playingTime;
    return data;
  }

}
