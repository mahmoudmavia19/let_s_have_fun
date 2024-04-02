// add_comments_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/image_constant.dart';
import 'controller/comments_controller.dart';

class AddCommentsScreen extends StatelessWidget {
  final CommentsController commentsController = Get.put(CommentsController());
  final String childName; // The name of the selected child

  AddCommentsScreen({required this.childName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(ImageConstant.puzzle_logo,width: 45.0,),
            Expanded(child: Text(AppStrings.addCommentsForChild(childName))),
          ],
        ),
        leading:  Container(),
        leadingWidth: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(()=>commentsController.state.value.getScreenWidget(_body(), (){})),
      ),
    );
  }

  _body()=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${AppStrings.enterComments}:',
        style: TextStyle(fontSize: 16.0),
      ),
      SizedBox(height: 10.0),
      TextField(
        controller: commentsController.commentsController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: AppStrings.enterCommentsHint,
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 20.0),
      ElevatedButton(
        onPressed: () {
          commentsController.sendComment();
        },
        child: Text(AppStrings.saveComments),
      ),
    ],
  );
}
