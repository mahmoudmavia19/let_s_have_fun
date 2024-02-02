
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminApiClient {
  FirebaseAuth firebaseAuth  ;
  FirebaseFirestore firebaseFirestore ;

  AdminApiClient(this.firebaseAuth, this.firebaseFirestore);

  Future<bool> signIn(String email, String password) async {
    var response =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return (await firebaseFirestore.collection('admins').doc(response.user!.uid).get()).exists;
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }


}
