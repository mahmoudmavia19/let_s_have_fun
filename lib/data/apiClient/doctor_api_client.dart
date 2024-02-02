import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../presentation/admin/doctors_mangement/model/doctor.dart';

class DoctorApiClient {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore ;
  DoctorApiClient(this.firebaseAuth, this.firebaseFirestore);

  Future<Doctor> signIn(String email, String password) async {
    var response =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return Doctor.fromJson((await firebaseFirestore.collection('doctors').doc(response.user!.uid).get()).data()!);
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

}