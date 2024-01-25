// add_comments_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_strings.dart';
import 'controller/comments_controller.dart';

class AddCommentsScreen extends StatelessWidget {
  final CommentsController commentsController = Get.put(CommentsController());
  final String childName; // The name of the selected child

  AddCommentsScreen({required this.childName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addCommentsForChild(childName)),
        leading:  Container(),
        leadingWidth: 2.0,
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
        child: Column(
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
              //  commentsController.saveComments(childName);
               Get.back();
              },
              child: Text(AppStrings.saveComments),
            ),
          ],
        ),
      ),
    );
  }
}
