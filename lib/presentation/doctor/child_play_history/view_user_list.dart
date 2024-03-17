// show_all_children_screen.dart
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/constant/constant.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/controller/child_controller.dart';
import 'package:let_s_have_fun/widgets/doctor_drawer.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import '../../admin/users_management/model/user.dart';

class ShowChildrenList extends GetWidget<ChildController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DoctorDrawer(),
      appBar: AppBar(
          title: Row(
            children: [
              Image.asset(ImageConstant.puzzle_logo,width: 50.0,),
              Text(AppStrings.childrenRecords),
            ],
          ),
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
            final List<User> children = controller.users;

            if (children.isEmpty) {
              return Text(AppStrings.noChildrenAvailable);
            }

            return ListView.builder(
              itemCount: children.length,
              itemBuilder: (context, index) {
                User child = children[index];
                return UserListItem(user: child, index: index);
              },
            );
          },
        ),
      ),

    );
  }
}

class UserListItem extends StatelessWidget {
  final User user;
  final int index;

  UserListItem({required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name,
            style: TextStyle(color: ColorConstant.primary, fontSize: 20.0)),
        subtitle: Text('${AppStrings.level}: ${convertToArabicWords(user.level.toString())}'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
             Get.toNamed(AppRoutes.playHistoryScreen, arguments: user.name);
        },
      ),
    );
  }
}
