import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/data/apiClient/admin_api_client.dart';
import 'package:let_s_have_fun/data/apiClient/doctor_api_client.dart';
import 'package:let_s_have_fun/data/apiClient/player_api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Get.put(firebaseAuth);
    Get.put(firebaseFirestore);
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));

  }
}
