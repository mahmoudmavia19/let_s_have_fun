import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/player.dart';

class PlayerApiClient {
   FirebaseAuth firebaseAuth ;
  FirebaseFirestore firebaseFirestore ;

   PlayerApiClient(this.firebaseAuth, this.firebaseFirestore);

   Future<Player> signIn(String email, String password) async {
     var response =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     return Player.fromJson((await firebaseFirestore.collection('players').doc(response.user!.uid).get()).data()!);
   }
   Future<Player> signUp(Player player, String password) async {
     var response =  await firebaseAuth.createUserWithEmailAndPassword(email: player.email!, password: password);
     player.id = response.user!.uid;
     await firebaseFirestore.collection('players').doc(response.user!.uid).set(player.toJson());
     return player;
   }


   Future<void> signOut() async {
     await firebaseAuth.signOut();
   }


}