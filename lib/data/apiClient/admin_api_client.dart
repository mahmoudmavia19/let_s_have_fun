

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';

import '../models/role.dart';

class AdminApiClient {
  FirebaseAuth firebaseAuth  ;
  FirebaseFirestore firebaseFirestore ;
  FirebaseStorage firebaseStorage ;

  AdminApiClient(this.firebaseAuth, this.firebaseFirestore,this.firebaseStorage);

  Future<bool> signIn(String email, String password) async {
    var response =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return (await firebaseFirestore.collection('admins').doc(response.user!.uid).get()).exists;
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }


  Future<void> addDoctorToFirebase(Doctor doctor, String password) async {
    // Create authentication account
    UserCredential authResult = await firebaseAuth.createUserWithEmailAndPassword(
      email: doctor.email!,
      password: password,
    );

    User? user = authResult.user;
    if (user == null) {
      print('Error creating user account');
      return;
    }
    doctor.uid = user.uid;
    await firebaseFirestore.collection('doctors').doc(user.uid).set(doctor.toJson());

    print('Doctor added successfully');
  }


  Future<void> updateDoctor(Doctor doctor) async {

    await firebaseFirestore.collection('doctors').doc(doctor.uid).update(doctor.toJson());
    await firebaseFirestore.collection('Roles').doc(doctor.uid).set(Role('doctor',doctor.isBlocked).toJson());

  }


  Future<List<Doctor>> getDoctorsList() {
    return firebaseFirestore.collection('doctors').get().then((querySnapshot) {
      List<Doctor> doctorsList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
         var doctor  = Doctor.fromJson(data);
         doctor.uid = doc.id;
        return doctor;
      }).toList();

      return doctorsList;
    }).catchError((e) {
       return <Doctor>[];
    });
  }

  Future<List<Player>> getPlayersList() async{
    return (await firebaseFirestore.collection('players').get()).docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      var player  = Player.fromJson(data);
      player.id = doc.id;
      return player;
    }) .toList();
  }

  Future<void> updatePlayer(Player player) async{
    await firebaseFirestore.collection('players').doc(player.id).update(player.toJson());
    await firebaseFirestore.collection('Roles').doc(player.id).set(Role('Player',player.isBlocked).toJson());

  }


}
