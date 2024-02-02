import 'dart:convert';

class Player {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  int? age;
  int? level;
  int? score;
  int? regameCount;
  Duration? gameTime;
  String? image;

  Player({
      this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.age,
    this.level,
    this.score,
    this.regameCount,
    this.gameTime,
    this.image,
  });

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'age': age,
      'level': level,
      'score': score,
      'regameCount': regameCount,
      'gameTime': gameTime?.inSeconds??0, // Convert Duration to seconds
      'image': image,
    };
  }

  // Deserialize from JSON
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      age: json['age'],
      level: json['level'],
      score: json['score'],
      regameCount: json['regameCount'],
      gameTime: Duration(seconds: json['gameTime']??0),
      image: json['image'],
      id: json['id'],
    );
  }
}
