// doctor_edit_profile_controller.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/remote_data_source/doctor_remote_data_source.dart';
import 'package:let_s_have_fun/data/requests/doctor_request.dart';

import '../../../admin/doctors_mangement/model/doctor.dart';

class DoctorEditProfileController extends GetxController {
  Rx<FlowState> state = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  DoctorRemoteDataSource doctorRemoteDataSource = Get.find<DoctorRemoteDataSourceImpl>();
  final Rx<Doctor> doctor = Rx<Doctor>(Doctor());
  RxBool edit = false.obs;
  Rx<File?> photo = Rx<File?>(null);
  Rx<File?> certificate = Rx<File?>(null);
  Future<void>getProfile()async{
   state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
   (await doctorRemoteDataSource.getDoctor()).fold((l) {
     state.value = ErrorState(StateRendererType.popupErrorState,l.message);
   }, (r) {
     doctor.value = r;
     print(doctor.value.toJson());
     nameController.text = doctor.value.name??"";
     emailController.text = doctor.value.email??'';
     phoneController.text = doctor.value.phone??'';
     professionController.text = doctor.value.profession??'';
     hospitalController.text = doctor.value.hospital??'';
     photoController.text = doctor.value.photo??'';
     nationalityController.text = doctor.value.nationality??'';
     ageController.text = doctor.value.age.toString();
     yearsOfExperienceController.text = doctor.value.yearsOfExperience.toString();
     state.value = ContentState();
   });
  }
  pickProfileImage() async{
    photo.value = File((await ImagePicker().pickImage(source: ImageSource.gallery))!.path);
  }
  pickCertificateImage() async{
    certificate.value = File((await ImagePicker().pickImage(source: ImageSource.gallery))!.path);
  }
  updateDoctorProfile() async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await doctorRemoteDataSource.updateDoctor(Doctor(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      profession: professionController.text,
      hospital: hospitalController.text,
      photo: photo.value?.path??doctor.value.photo,
      nationality: nationalityController.text,
      age: int.parse(ageController.text),
      yearsOfExperience: int.parse(yearsOfExperienceController.text),
      uid: doctor.value.uid,
      accepted: doctor.value.accepted,
      certificate: certificate.value?.path??doctor.value.certificate,
      isBlocked: doctor.value.isBlocked,
    ))).fold((l) {
      state.value = ErrorState(StateRendererType.popupErrorState,l.message);
    }, (r) {
      state.value = ContentState();
    });
  }
  editToggle() {
    edit.value = !edit.value;
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController certificateController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController photoController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController yearsOfExperienceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  void onInit() async{
    await getProfile();
    super.onInit();
  }
 }
