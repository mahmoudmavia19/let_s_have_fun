import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/presentation/admin/users_management/controller/users_controller.dart';
import 'package:let_s_have_fun/presentation/admin/users_management/userprofile_admin.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/admin_drawer.dart';
import 'model/user.dart';

class UsersManagementScreen extends GetWidget<UsersController> {

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
      body:Obx(() => controller.state.value.getScreenWidget(_body(), (){})) ,
    );
  }
  
  _body()=>RefreshIndicator(
    onRefresh: ()async{
      controller.getPlayers();
    },
    child: ListView.builder(
        itemCount: controller.players.length,
        itemBuilder: (context, index) {
          Player user = controller.players[index];
          return Card(
            child: ListTile(
                title: Text(user.name??'',style: TextStyle(color: ColorConstant.primary,fontSize: 20.0),),
                subtitle: Text(user.email??''),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image??''),
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
