import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/presentation/admin/users_management/controller/users_controller.dart';
import 'package:let_s_have_fun/presentation/admin/users_management/userprofile_admin.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/admin_drawer.dart';
import 'model/user.dart';

class UsersManagementScreen extends GetWidget<UsersController> {
  final List<User> userList = [
    User(
      name: "اسم المستخدم",
      email: "test1@email.com",
      phone: "053-456-7890",
      address: "الشارع الرئيسي، المدينة",
      age: 28,
      level: 3,
      score: 150,
      regameCount: 7,
      gameTime: Duration(hours: 2, minutes: 30),
      image: "https://example.com/ahmed.jpg",
    ),
    User(
      name: "اسم المستخدم2",
      email: "test2@email.com",
      phone: "057-654-3210",
      address: "شارع النخيل، القرية",
      age: 25,
      level: 2,
      score: 120,
      regameCount: 5,
      gameTime: Duration(hours: 2, minutes: 30),
      image: "https://example.com/fatma.jpg",
    ),
    // Add more users with Arabic data as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(ImageConstant.puzzle_logo,width: 50.0,),
            Text(AppStrings.userManagement),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            User user = userList[index];
            return Card(
              child: ListTile(
                  title: Text(user.name,style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
                   subtitle: Text(user.email),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                  onTap: () {
                    Get.dialog(
                      UserProfileScreen(user: user),
                    );
                  }),
            );
          }),
    );
  }
}
