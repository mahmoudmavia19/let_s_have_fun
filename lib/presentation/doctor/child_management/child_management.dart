// show_all_children_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/child_user_dialog.dart';
import 'package:let_s_have_fun/presentation/doctor/child_management/controller/child_controller.dart';
import 'package:let_s_have_fun/widgets/doctor_drawer.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';
import '../../../data/models/player.dart';
import '../../admin/users_management/model/user.dart';

class ShowAllChildrenScreen extends GetWidget<ChildController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DoctorDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(ImageConstant.puzzle_logo,width: 50.0,),
            Text(AppStrings.showAllChildren),
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
             return  controller.state.value.getScreenWidget(_body(), (){
               controller.getAllChildren();
             });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addChildScreen) ;
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _body()=>RefreshIndicator(
    onRefresh: () async {
      controller.getAllChildren();
    },
    child: ListView.builder(
      itemCount:  controller.users.length,
      itemBuilder: (context, index) {
        Player child =  controller.users[index];
        return UserListItem(user: child, index: index);
      },
    ),
  );
}


class UserListItem extends StatelessWidget {
  final Player user;
  final int index;

  UserListItem({required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name??'',
            style: TextStyle(color: ColorConstant.primary, fontSize: 20.0)),
        subtitle: Text('${AppStrings.age}: ${user.email??''}'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Show the UserDetailsDialog when the ListTile is tapped
          showDialog(
            context: context,
            builder: (context) {
              return ChildDetailsDialog(user: user);
            },
          );
        },
      ),
    );
  }
}
