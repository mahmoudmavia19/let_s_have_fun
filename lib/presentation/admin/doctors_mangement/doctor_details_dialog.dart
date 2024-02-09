import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import 'model/doctor.dart';


class DoctorDetailsDialog extends StatelessWidget {
  final Doctor doctor;
  final void Function()? onPressed;
  DoctorDetailsDialog({required this.doctor,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(doctor.name??'',style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
      content: ListTile(
         subtitle:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppStrings.email} ${doctor.email}'),
            Text('${AppStrings.phone} ${doctor.phone}'),
            Text('${AppStrings.profession} ${doctor.profession}'),
            Text('${AppStrings.hospital} ${doctor.hospital}'),
            Text('${AppStrings.nationality} ${doctor.nationality}'),
            Text('${AppStrings.age} ${doctor.age}'),
            Text('${AppStrings.yearsOfExperience} ${doctor.yearsOfExperience}'),
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
          onPressed:onPressed,
          child: Text(doctor.isBlocked?AppStrings.unblockUser:AppStrings.blockUser),
        ),
      ],
    );
  }
}
