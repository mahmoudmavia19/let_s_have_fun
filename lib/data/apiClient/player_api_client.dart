import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/data/apiClient/doctor_api_client.dart';
import 'package:let_s_have_fun/data/models/commnet.dart';
import 'package:let_s_have_fun/data/models/play_game.dart';
import 'package:let_s_have_fun/data/models/role.dart';
import 'package:let_s_have_fun/presentation/doctor/exercies_management/model/level.dart';
import '../../presentation/admin/doctors_mangement/model/doctor.dart';
import '../../presentation/doctor/exercies_management/model/Exercise.dart';
import '../models/player.dart';

class PlayerApiClient {
   FirebaseAuth firebaseAuth ;
  FirebaseFirestore firebaseFirestore ;

   PlayerApiClient(this.firebaseAuth, this.firebaseFirestore);

   Future<Role> signIn(String email, String password) async {
       await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
       print(firebaseAuth.currentUser?.uid);

     var role =  Role.fromJson((await firebaseFirestore.collection('Roles').doc(firebaseAuth.currentUser?.uid).get()).data()??{});
      if(role.role == 'doctor'){
        Get.find<DoctorApiClient>().doctorId = firebaseAuth.currentUser?.uid;
      }
     return role;

   }
   Future<Player> signUp(Player player, String password) async {
     var response =  await firebaseAuth.createUserWithEmailAndPassword(email: player.email!, password: password);
     player.id = response.user!.uid;
     await firebaseFirestore.collection('Roles').doc(response.user!.uid).set(Role('Player',player.isBlocked).toJson());
     await firebaseFirestore.collection('players').doc(response.user!.uid).set(player.toJson());
     return player;
   }


   Future<void> signOut() async {
     await firebaseAuth.signOut();
   }

   Future<List<Exercise>> getExercies() async{
     var response = await firebaseFirestore.collection('exercies').get();
     return response.docs.map((e) => Exercise.fromJson(e.data())).toList();
   }

   Future<Player> getProfile() async {
     var response = await firebaseFirestore.collection('players').doc(firebaseAuth.currentUser?.uid).get() ;
     return Player.fromJson(response.data()??{});
   }

   Future<void> updateProfile(Player player)async {
     await firebaseFirestore.collection('players').doc(firebaseAuth.currentUser?.uid).update(player.toJson());
   }
   Future<List<Doctor>> getDoctorsList() {
     return firebaseFirestore.collection('doctors')
         .where('accepted', isEqualTo: true)
         .get().then((querySnapshot) {
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

   Future<void> playGame(PlayGame play)async {
      play.userId = firebaseAuth.currentUser?.uid;
     try {
       await firebaseFirestore.collection('players').doc(firebaseAuth.currentUser?.uid).collection('records').doc(play.uid).update(play.toJson());
     }
     catch(e){
       await firebaseFirestore.collection('players').doc(firebaseAuth.currentUser?.uid).collection('records').doc(play.uid).set(play.toJson());
     }
    }

    Future<void> updateScore(PlayGame play,Level level)async {
      await firebaseFirestore.collection('players').doc(firebaseAuth.currentUser?.uid).update({
        'score': FieldValue.increment(level.levelScore),
      });
    }

    Future<List<PlayGame>> getPlayHistory() async {
      var response = await firebaseFirestore.collection('players').doc(firebaseAuth.currentUser?.uid).collection('records').get();
      return response.docs.map((e) => PlayGame.fromJson(e.data())).toList();
    }

    Future<List<Comment>> getComments() async {
      var response = await firebaseFirestore.collection('players').doc(firebaseAuth.currentUser?.uid).collection('comment').get();
      return response.docs.map((e) {
        return Comment.fromJson(e.data());
      }).toList();
    }
}