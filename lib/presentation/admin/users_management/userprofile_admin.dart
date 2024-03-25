import 'package:flutter/material.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import 'controller/users_controller.dart';
import 'model/user.dart';

class UserProfileScreen extends StatelessWidget {
  final Player user; // Assuming you have the User class defined
  UsersController controller = Get.find<UsersController>();
  UserProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppStrings.name}${user.name??''}',style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
            Text('${AppStrings.email}${user.email??''}'),
            Text('${AppStrings.phone}${user.phone??''}'),
            Text('${AppStrings.address}${user.address??''}'),
            Text('${AppStrings.age}${user.age??''}'),
            Text('${AppStrings.level}: ${user.level??0}'),
            Text('${AppStrings.score}${user.score??0}'),
            Text('${AppStrings.regameCount}${user.regameCount??0}'),
            Text('${AppStrings.gameTime}${user.gameTime?.inHours}:${user.gameTime?.inMinutes}'),
             SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Get.back();
                controller.blockPlayer(user);
               },
              child: Text(user.isBlocked? AppStrings.unblockUser:AppStrings.blockUser),
            ),
          ],
        ),
      ),
    );
  }
}
