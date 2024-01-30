import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AuthBackground extends StatelessWidget {
  const AuthBackground({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstant.primary,
      body: Center(
        child: SizedBox(
          width: 430,
          height: 1068,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 633.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup121,
                        height: 503.v,
                        width: 430.h,
                        alignment: Alignment.topCenter,
                      ),
                      SvgPicture.asset(
                        ImageConstant.dots_top,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup119,
                        height: 347.v,
                        width: 206.h,
                        alignment: Alignment.topLeft,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          height: 500.v,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageConstant.imgGroup1,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildRecentOrders(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentOrders() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup131,
            height: 150.v,
            width: 134.h,
            margin: EdgeInsets.only(bottom: 110.v),
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
