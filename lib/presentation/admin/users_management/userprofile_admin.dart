import 'package:flutter/material.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import 'model/user.dart';

class UserProfileScreen extends StatelessWidget {
  final User user; // Assuming you have the User class defined

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
            Text('${AppStrings.name}${user.name}',style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
            Text('${AppStrings.email}${user.email}'),
            Text('${AppStrings.phone}${user.phone}'),
            Text('${AppStrings.address}${user.address}'),
            Text('${AppStrings.age}${user.age}'),
            Text('${AppStrings.level}: ${user.level}'),
            Text('${AppStrings.score}${user.score}'),
            Text('${AppStrings.regameCount}${user.regameCount}'),
            Text('${AppStrings.gameTime}${user.gameTime.inHours}:${user.gameTime.inMinutes}'),
             SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your block logic here
                // This is just an example, you can implement your own logic
                print('${AppStrings.blockUser} Pressed');
              },
              child: Text(AppStrings.blockUser),
            ),
          ],
        ),
      ),
    );
  }
}
