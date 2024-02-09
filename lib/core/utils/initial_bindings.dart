import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/data/apiClient/admin_api_client.dart';
import 'package:let_s_have_fun/data/apiClient/player_api_client.dart';

import '../../data/apiClient/doctor_api_client.dart';
import '../../data/remote_data_source/admin_remote_data_source.dart';
import '../../data/remote_data_source/doctor_remote_data_source.dart';
import '../../data/remote_data_source/player_remote_data_source.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Get.put(firebaseAuth);
    Get.put(firebaseFirestore);
    Get.put(firebaseStorage);
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(AdminApiClient(Get.find(), Get.find(), Get.find()));
    Get.put(AdminRemoteDataSourceImpl(Get.find(), Get.find()));
    Get.put(DoctorApiClient(Get.find(),Get.find()));
    Get.put(DoctorRemoteDataSourceImpl(Get.find(), Get.find()));
    Get.put(PlayerApiClient(Get.find(), Get.find()));
    Get.put(PlayerRemoteDataSourceImpl(Get.find(), Get.find()));

  }
}
