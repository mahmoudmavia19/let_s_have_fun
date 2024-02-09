
class Doctor {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? profession;
  String? hospital;
  String? photo;
  String? nationality;
  int? age;
  int? yearsOfExperience;
  bool  isBlocked;

  Doctor({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.profession,
    this.hospital,
    this.photo,
    this.nationality,
    this.age,
    this.yearsOfExperience,
    this.isBlocked = false
  });

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profession': profession,
      'hospital': hospital,
      'photo': photo,
      'nationality': nationality,
      'age': age,
      'yearsOfExperience': yearsOfExperience,
      'isBlocked': isBlocked
    };
  }

  // Deserialize from JSON
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profession: json['profession'],
      hospital: json['hospital'],
      photo: json['photo'],
      nationality: json['nationality'],
      age: json['age'],
      yearsOfExperience: json['yearsOfExperience'],
      isBlocked: json['isBlocked']??false
    );
  }
}
