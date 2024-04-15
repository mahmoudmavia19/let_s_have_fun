import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/data/models/commnet.dart';
import 'package:let_s_have_fun/data/models/play_game.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import '../../presentation/admin/doctors_mangement/model/doctor.dart';
import '../../presentation/doctor/child_play_history/model/play_history.dart';
import '../../presentation/doctor/exercies_management/model/Exercise.dart';
import '../../presentation/doctor/games_management/model/game.dart';
import '../models/role.dart';

class DoctorApiClient {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore ;
  FirebaseStorage firebaseStorage ;
  DoctorApiClient(this.firebaseAuth, this.firebaseFirestore,this.firebaseStorage);
  
  String? doctorId ;

  Future<Doctor> signIn(String email, String password) async {
    var response =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    doctorId = response.user!.uid;
    return Doctor.fromJson((await firebaseFirestore.collection('doctors').doc(response.user!.uid).get()).data()!);
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
  Future<Doctor> signUp(Doctor doctor, String password) async {
    var response =  await firebaseAuth.createUserWithEmailAndPassword(email: doctor.email!, password: password);
    doctor.uid = response.user!.uid;
    await firebaseFirestore.collection('Roles').doc(response.user!.uid).set(Role('doctor',doctor.isBlocked).toJson());
    await firebaseStorage.ref('certificates/${response.user!.uid}').putFile(File(doctor.certificate!));
    doctor.certificate = await firebaseStorage.ref('certificates/${response.user!.uid}').getDownloadURL();
    await firebaseFirestore.collection('doctors').doc(response.user!.uid).set(doctor.toJson());
    doctorId = response.user!.uid;
    return doctor;
  }
  Future<Doctor> getDoctor()async {
    var response = await firebaseFirestore.collection('doctors').doc(doctorId).get();
    return Doctor.fromJson(response.data()!);
  }
  Future<void> updateDoctor(Doctor doctor)async {
     if(!doctor.photo!.contains('https')){
      await firebaseStorage.ref('doctors/${doctorId}').putFile(File(doctor.photo!));
      doctor.photo = await firebaseStorage.ref('doctors/${doctorId}').getDownloadURL();
    }
     if(!doctor.certificate!.contains('https')){
      await firebaseStorage.ref('certificates/${doctorId}').putFile(File(doctor.certificate!));
      doctor.certificate = await firebaseStorage.ref('certificates/${doctorId}').getDownloadURL();
    }
    await firebaseFirestore.collection('doctors').doc(doctorId).update(doctor.toJson());
  }
  Future<List<Player>> getPlayers() async {
    var response = await firebaseFirestore.collection('players')
        .where('doctorID',isEqualTo: doctorId)
        .get();
    return response.docs.map((e) => Player.fromJson(e.data())).toList();
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

  addPlayer(Player player,String password) async{
    var response =  await firebaseAuth.createUserWithEmailAndPassword(email: player.email!, password:password);
    player.id = response.user?.uid;
    player.doctorID = doctorId;
    await firebaseFirestore.collection('Roles').doc(response.user!.uid).set(Role('Player',player.isBlocked).toJson());
    await firebaseFirestore.collection('players').doc(response.user?.uid).set(player.toJson());
  }

  Future<List<PlayHistory>> getPlayerRecords(String userId) async {
    var response = await firebaseFirestore.collection('players').doc(userId).collection('records')
    .where('doctorID',isEqualTo: doctorId)
        .get();
    return response.docs.map((e) {
      PlayGame playGame = PlayGame.fromJson(e.data());
      return PlayHistory(
        childId: playGame.userId,
        levelNumber: playGame.levelId!+1,
        levelPoints: playGame.score ?? 0,
        playingTime : playGame.time ,
        stageNumber: playGame.recount
      );
    }).toList();
  }

  Future<void> sendComment(Comment comment) async {
    comment.doctorId = doctorId;
    await firebaseFirestore.collection('players').doc(comment.userId).collection('comment').add(comment.toJson());
  }

}