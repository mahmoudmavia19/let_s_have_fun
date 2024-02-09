// show_all_doctors_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/controller/doctors_controller.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/doctor_details_dialog.dart';
import 'package:let_s_have_fun/widgets/admin_drawer.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import 'model/doctor.dart';

class ShowAllDoctorsScreen extends StatelessWidget {
  final DoctorsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: AppBar(
        title: Text(AppStrings.showAllDoctors),
        centerTitle: true,
         actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ]
      ),
      body: Center(
        child: Obx(
              () {
            return controller.state.value.getScreenWidget(_widget(), (){
              controller.getDoctors();
            });
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed:(){
        Get.toNamed(AppRoutes.addDoctorsManagementAdmin);
      },
      child: Icon(Icons.add),),
    );
  }
  _widget()=>ListView.builder(
    itemCount: controller.doctors.length,
    itemBuilder: (context, index) {
      Doctor doctor = controller.doctors[index];
      return DoctorListItem(doctor: doctor);
    },
  );
}

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;
  final DoctorsController controller = Get.find();

  DoctorListItem({required this.doctor});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        onTap: () {
          Get.dialog(DoctorDetailsDialog(doctor: doctor,onPressed: () {
             controller.blockDoctor(doctor);
          },));
        },
        title: Text(doctor.name??'', style: TextStyle(color: ColorConstant.primary, fontSize: 20.0)),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctor.email??''),
            Text(doctor.profession??''),
          ],
        ),
        leading: CircleAvatar(
          radius:30,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
