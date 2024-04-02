import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';
import 'package:let_s_have_fun/presentation/player/player_doctors_screen/controller/player_doctors_controller.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';


class PlayerDoctorsScreen extends StatelessWidget {
  final PlayerDoctorsController controller = Get.put(PlayerDoctorsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Row(
          children: [
             Image.asset(ImageConstant.puzzle_logo,width: 50,height: 50,),
            Text(AppStrings.doctors),
          ],
        ),
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ) ,
      body: Center(
        child: Obx(
              () {
            return controller.state.value.getScreenWidget(
              _body(),
              () {},
            );
          },
        ),
      ),

    );
  }

  _body()=>RefreshIndicator(
    onRefresh: () async {
      controller.getDoctors();
    },
    child: ListView.builder(
      itemCount: controller.doctors.length,
      itemBuilder: (context, index) {
        Doctor doctor = controller.doctors[index];
        return DoctorListItem(doctor: doctor);
      },
    ),
  );
}

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;

  DoctorListItem({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.dialog(_doctorDetailsDialog(doctor: doctor));
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
          backgroundImage: NetworkImage(doctor.photo??''),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  Widget _doctorDetailsDialog({required Doctor doctor}) => AlertDialog(
    title:Text(doctor.name??'',style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
    content: ListTile(
      subtitle:Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${AppStrings.email}: ${doctor.email}'),
          Text('${AppStrings.phone}: ${doctor.phone}'),
          Text('${AppStrings.profession}: ${doctor.profession}'),
          Text('${AppStrings.hospital}: ${doctor.hospital}'),
          Text('${AppStrings.nationality}: ${doctor.nationality}'),
          Text('${AppStrings.age}: ${doctor.age}'),
          Text('${AppStrings.yearsOfExperience}: ${doctor.yearsOfExperience}'),
        ],
      ),
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(AppStrings.cancel),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
           Get.dialog(
              Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(doctor.name??'',style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
                      Container(
                        height: 300,
                         child: ListView.builder(
                           itemCount:Get.find<PlayerDoctorsController>().comments.where((p0) => p0.doctorId==doctor.uid).toList().length,
                           itemBuilder:(context, index) {
                             var comment = Get.find<PlayerDoctorsController>().comments.where((p0) => p0.doctorId==doctor.uid).toList()[index];
                              return ListTile(
                             title: Text(comment.comment??''),
                             subtitle: Row(
                               children: [
                                 Text(DateFormat.yMMMd('ar').format(comment.date!)),
/*
                                 TextButton(onPressed: (){
                                   Get.dialog(
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Dialog(
                                         child: Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Column(
                                             mainAxisSize: MainAxisSize.min,
                                             children: [
                                               Text('اكتب الرد'),
                                               TextFormField(
                                                 decoration: InputDecoration(
                                                   hintText: 'اكتب الرد',
                                                   suffixIcon: IconButton(
                                                     onPressed: () {
                                                       Get.back();
                                                     },
                                                     icon: Icon(Icons.send)
                                                   )
                                                 ),
                                               )
                                             ]
                                           )
                                         )
                                       ),
                                     )
                                   );
                                 }, child: Text('رد')) ,
*/
                               ],
                             ),
                           );
                           },
                                     ),
                      ),
                      ElevatedButton(onPressed: () {
                        Get.back();
                      }, child: Text(AppStrings.close)),
                    ],
                  ),
                ),
              )
           );
        },
        child: Text(AppStrings.showAllComments),
      ),
     ],
  );
}
