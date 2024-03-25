import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import 'controller/doctors_controller.dart';
import 'model/doctor.dart';


class DoctorDetailsDialog extends StatelessWidget {
  final Doctor doctor;
  void Function()? onPressed ;
  DoctorsController controller = Get.find<DoctorsController>();
  DoctorDetailsDialog({required this.doctor ,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            TextButton(onPressed: (){
              Get.dialog(
                Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(doctor.certificate??'',
                      width: Get.width*0.5,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator()
                        ) ;
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },),
                      Visibility(
                        visible: !doctor.accepted,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(onPressed: (){
                            controller.acceptedDoctor(doctor);
                            Get.back();
                            }, child: Text('قبول')),
                            TextButton(onPressed: (){
                              Get.back();
                            }, child: Text('طلب اعادة ارسال')),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              );
            }, child: Text(AppStrings.certificate)),
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
          onPressed: onPressed,
          child: Text(!doctor.isBlocked?AppStrings.blockUser:AppStrings.unBlockUser),
        ),
      ],
    );
  }
}
