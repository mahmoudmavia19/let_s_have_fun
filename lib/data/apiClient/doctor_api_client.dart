import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../presentation/admin/doctors_mangement/model/doctor.dart';
import '../models/role.dart';

class DoctorApiClient {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore ;
  FirebaseStorage firebaseStorage ;
  DoctorApiClient(this.firebaseAuth, this.firebaseFirestore,this.firebaseStorage);

  Future<Doctor> signIn(String email, String password) async {
    var response =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return Doctor.fromJson((await firebaseFirestore.collection('doctors').doc(response.user!.uid).get()).data()!);
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<Doctor> signUp(Doctor doctor, String password) async {
    var response =  await firebaseAuth.createUserWithEmailAndPassword(email: doctor.email!, password: password);
    doctor.uid = response.user!.uid;
    await firebaseFirestore.collection('Roles').doc(response.user!.uid).set(Role('doctor',doctor.isBlocked).toJson());
    await firebaseStorage.ref('doctors/${response.user!.uid}').putFile(File(doctor.certificate!));
    doctor.certificate = await firebaseStorage.ref('doctors/${response.user!.uid}').getDownloadURL();
    await firebaseFirestore.collection('doctors').doc(response.user!.uid).set(doctor.toJson());
    return doctor;
  }

}