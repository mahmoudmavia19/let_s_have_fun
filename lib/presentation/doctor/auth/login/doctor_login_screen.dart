import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/widgets/auth_background.dart';

class DoctorLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: [
              AuthBackground(),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(AppStrings.login,style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      )),

                      _buildTextField(AppStrings.email),
                      _buildTextField(AppStrings.password),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        width:  double.maxFinite,
                        child: ElevatedButton(onPressed: () {
                          Get.toNamed(AppRoutes.showAllChildrenDoctors);
                        }, child: Text(AppStrings.login),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD27893),
                                foregroundColor: Colors.white
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_forward_ios)),
              ),
            ]
        ) ,
      ),
    );
  }

  _buildTextField(String title , {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: TextStyle(
            fontSize: 16,
          )),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ColorConstant.primary.withOpacity(1),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: TextFormField(
              controller: controller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
