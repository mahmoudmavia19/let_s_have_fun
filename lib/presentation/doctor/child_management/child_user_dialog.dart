// user_details_dialog.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import '../../admin/users_management/model/user.dart';


class ChildDetailsDialog extends StatelessWidget {
  final Player user;

  ChildDetailsDialog({required this.user});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppStrings.name}: ${user.name??''}',style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
            Text('${AppStrings.email}: ${user.email??''}'),
            Text('${AppStrings.phone}: ${user.phone??''}'),
            Text('${AppStrings.address}: ${user.address??''}'),
            Text('${AppStrings.age}: ${user.age??''}'),
            Text('${AppStrings.level}: ${user.level??'0'}'),
            Text('${AppStrings.score}: ${user.score??'0'}'),
            Text('${AppStrings.regameCount}: ${user.regameCount??0}'),
            Visibility(
                visible: user.gameTime != null,
                child: Text('${AppStrings.gameTime}: ${formatDuration(user.gameTime!,Get.locale!.languageCode)}')),
             SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text(AppStrings.close),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
