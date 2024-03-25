import 'package:flutter/cupertino.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/remote_data_source/admin_remote_data_source.dart';

import '../../../../core/app_export.dart';
import '../model/doctor.dart';

class DoctorsController extends GetxController {
  final RxBool isPasswordObscured = true.obs;

  final RxList<Doctor> doctors = <Doctor>[].obs;
  final RxList<Doctor> doctorsNotAccepted = <Doctor>[].obs;
  Rx<FlowState> state = Rx(ContentState());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController photoController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController yearsOfExperienceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AdminRemoteDataSource adminRemoteDataSource = Get.find<AdminRemoteDataSourceImpl>();

  addDoctor() async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    if(passwordController.text == confirmPasswordController.text){
      if(!isEmailValid(emailController.text.trim())){
        state.value = ErrorState(StateRendererType.popupErrorState,AppStrings.invalidEmail);
      }else {
        if(isPasswordValid(passwordController.text.trim())){
        var doctor = Doctor(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          profession: professionController.text,
          hospital: hospitalController.text,
          nationality: nationalityController.text,
          age: int.parse(ageController.text.trim()),
          yearsOfExperience: int.parse(yearsOfExperienceController.text.trim()),
        );
        (await adminRemoteDataSource.addDoctor(doctor, passwordController.text))
            .fold((l) {
          state.value =
              ErrorState(StateRendererType.popupErrorState, l.message);
        }, (r) {
          state.value = ContentState();
          doctors.add(doctor);


          Get.back();
        });
        } else {
          state.value = ErrorState(StateRendererType.popupErrorState,AppStrings.passwordNotValid);
        }
      }
    } else {
      state.value = ErrorState(StateRendererType.popupErrorState,AppStrings.passwordNotMatch);
     }
  }

  getDoctors()async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await adminRemoteDataSource.getDoctors()).fold((l) {
      state.value = ErrorState(StateRendererType.fullScreenErrorState, l.message);
    }, (r) {
      doctors.value = r.where((element) =>element.accepted).toList();
      doctorsNotAccepted.value = r.where((element) => !element.accepted).toList();
      state.value = ContentState();
    }
    );
  }

  blockDoctor(Doctor doctor)async{
    doctor.isBlocked = !doctor.isBlocked;
    (await adminRemoteDataSource.updateDoctor(doctor)).fold((l) {
      state.value = ErrorState(StateRendererType.fullScreenErrorState, l.message);
    }, (r) {
      doctors[doctors.indexOf(doctor)].isBlocked = doctor.isBlocked;
      state.value = SuccessState(StateRendererType.popupSuccessState, AppStrings.success);
    });
  }
  acceptedDoctor(Doctor doctor)async{
    doctor.accepted = !doctor.accepted;
    (await adminRemoteDataSource.updateDoctor(doctor)).fold((l) {
      state.value = ErrorState(StateRendererType.fullScreenErrorState, l.message);
    }, (r) {
      doctors[doctors.indexOf(doctor)].accepted = doctor.accepted;
      getDoctors();
      state.value = SuccessState(StateRendererType.popupSuccessState, AppStrings.success);
    });
  }
  @override
  void onInit() {
    // Initialize the list of doctors (you might fetch it from a data source)
    getDoctors();
   /* doctors.assignAll([
      Doctor(
        name: "د.اسم الاخصائي",
        email: "test.sp@example.com",
        phone: "053-456-7890",
        profession: "اخصائي نفسي",
        hospital: "مستشفى العام",
        photo: "https://example.com/ahmed_ali.jpg",
        nationality: "سعودي",
        age: 45,
        yearsOfExperience: 20,
      ),
      // Add more doctors with Arabic data as needed
    ]);*/

    super.onInit();
  }
}