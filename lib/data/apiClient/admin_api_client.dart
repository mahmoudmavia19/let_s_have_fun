
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/data/models/game_request.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/Exercise.dart';
import 'package:let_s_have_fun/presentation/admin/games_management/model/game.dart';

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

  Future<Exercise> addExercies(Exercise exercise) async{
   var response =  await firebaseFirestore.collection('exercies').add(exercise.toJson());
   exercise.uid = response.id;
   await firebaseFirestore.collection('exercies').doc(response.id).update(exercise.toJson());
   return exercise;
  }
  Future<void> deleteExercies(Exercise exercise) async{
    await firebaseFirestore.collection('exercies').doc(exercise.uid).delete();
  }

  Future<List<Exercise>> getExercies() async{
    var response = await firebaseFirestore.collection('exercies').get();
    return response.docs.map((e) => Exercise.fromJson(e.data())).toList();
  }

  Future<void> updateLevels(Exercise exercise) async{
    print(exercise.uid);
    await firebaseFirestore.collection('exercies').doc(exercise.uid).update({
      'levels': exercise.levels?.map((level) => level.toJson()).toList(),
    });
  }
  Future<Game> updateGameOfLevel(Exercise exercise,Game game) async {
    if (game.img != null) {
       if(!(game.img!.contains('https'))) {
         var imgQ = await firebaseStorage.ref('images/games/${XFile(game.img!).name}').putFile(
          File(game.img!));
      var linkQ = await imgQ.ref.getDownloadURL();
      game.img = linkQ;
       }
    }

    for (var i = 0; i < game.imgsAnswer.length; i++) {
      if (game.imgsAnswer[i].url != null) {
        if (!(game.imgsAnswer[i].url!.contains('https'))) {
          var imgA = await firebaseStorage.ref(
              'images/games/${XFile(game.imgsAnswer[i].url!).name}')
              .putFile(
              File(game.imgsAnswer[i].url!));
          var link = await imgA.ref.getDownloadURL();
          print('link $link');
          game.imgsAnswer[i].url = link;
        }
      }
    }

    final updatedLevels = exercise.levels?.map((level) {
      if (level.id == game.levelId) {
        final updatedGames = level.games ?? [];
        if (updatedGames.isEmpty) {
          updatedGames.add(game);
        } else {
          updatedGames[0] = game;
        }
        level.games = updatedGames;
      }
      return level.toJson();
    }).toList();

    await firebaseFirestore.collection('exercies').doc(exercise.uid).update({
      'levels': updatedLevels,
    });
    return game ;
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
  }


}
