import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/color_constant.dart';
import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                               image: AssetImage(
                                ImageConstant.imgGroup1,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgGroup116,
                                height: 127.v,
                                width: 102.h,
                                alignment: Alignment.centerRight,
                              ),
                              SizedBox(height: 259.v),
                              Text(
                                "msg".tr,
                                style: theme.textTheme.displayMedium,
                              ),
                             ],
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
    ));
  }

  /// Section Widget
  Widget _buildRecentOrders() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup131,
            height: 220.v,
            width: 134.h,
            margin: EdgeInsets.only(bottom: 79.v),
          ),

          Container(
            height: 294.v,
            width: 285.h,
            margin: EdgeInsets.only(top: 5.v),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup114,
                  height: 267.v,
                  width: 187.h,
                  alignment: Alignment.bottomLeft,
                ),
                SvgPicture.asset( ImageConstant.imgGroup115,
                  height: 180.v,
                  width: 163.h,
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
