import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/color_constant.dart';

class PlayerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Row(
          children: [
            Image.asset(ImageConstant.puzzle_logo,width: 50,height: 50,),
            Text(AppStrings.profile),
          ],
        ),
        centerTitle: true,
      ) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(AppStrings.register,style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )),
            _buildTextField(AppStrings.name),
            _buildTextField(AppStrings.phone),
            _buildTextField(AppStrings.email),
            _buildTextField(AppStrings.age),
            _buildTextField(AppStrings.gender),

            Container(
              padding: EdgeInsets.all(8.0),
              width:  double.maxFinite,
              child: ElevatedButton(onPressed: () {

              }, child: Text(AppStrings.saveChanges),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.btnColor,
                      foregroundColor: Colors.white
                  )),
            ),
           ],
        ),
      ) ,
    );
  }

  _buildTextField(String title , {TextEditingController? controller,void Function()? onTap }) {
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
             ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: TextFormField(
              onTap: onTap,
              readOnly: onTap!=null?true:false,
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
