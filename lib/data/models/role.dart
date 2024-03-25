class Role {
  String? role;
   bool isBlocked = false;
  Role(this.role,this.isBlocked);
  Role.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    isBlocked = json['isBlocked']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['isBlocked'] = this.isBlocked;
    return data;

  }
}