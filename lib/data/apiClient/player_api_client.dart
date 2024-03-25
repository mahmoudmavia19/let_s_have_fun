import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:let_s_have_fun/data/models/role.dart';

import '../models/player.dart';

class PlayerApiClient {
   FirebaseAuth firebaseAuth ;
  FirebaseFirestore firebaseFirestore ;

   PlayerApiClient(this.firebaseAuth, this.firebaseFirestore);

   Future<Role> signIn(String email, String password) async {
       await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
       print(firebaseAuth.currentUser?.uid);
     return Role.fromJson((await firebaseFirestore.collection('Roles').doc(firebaseAuth.currentUser?.uid).get()).data()??{});

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


}