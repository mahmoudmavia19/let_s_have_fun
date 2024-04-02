

import 'dart:io';

class DoctorRequest{
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? profession;
  String? hospital;
  File? photo;
  File? certificate ;
  String? nationality;
  int? age;
  int? yearsOfExperience;
  bool  isBlocked;
  bool  accepted = false;


  DoctorRequest({
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
    this.isBlocked = false,
    this.certificate ,
    this.accepted = false
  });}
