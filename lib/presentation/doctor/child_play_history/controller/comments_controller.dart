// comments_controller.dart
import 'package:flutter/material.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/model/user.dart';

import '../../../../core/app_export.dart';

class CommentsController extends GetxController {
  final TextEditingController commentsController = TextEditingController();

  void saveComments(Child childUser) {
    String comments = commentsController.text;
    childUser.comments = comments;
    // Save comments to your data store or do something with them
    // For example, you could update the comments field in the childUser object
  }

  @override
  void onClose() {
    commentsController.dispose();
    super.onClose();
  }
}
