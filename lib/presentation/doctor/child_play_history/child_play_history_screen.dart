// view_play_history_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/app_strings.dart';
import '../../../routes/app_routes.dart';
import 'controller/play_history_controller.dart';


class ViewPlayHistoryScreen extends StatelessWidget {
  final PlayHistoryController playHistoryController = Get.find();
  final String childName; // The name of the selected child

  ViewPlayHistoryScreen({required this.childName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.playHistoryForChild(childName)),
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
      body: Obx(
            () => ListView.builder(
          itemCount: playHistoryController.playHistory.length,
          itemBuilder: (context, index) {
            var session = playHistoryController.playHistory[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.commentsScreen, arguments: childName);
                },
                title: Text('${AppStrings.level}:${convertToArabicWords(session.levelNumber.toString())},${AppStrings.points}: ${session.levelPoints}'),
                subtitle: Text('${AppStrings.regameCount}: ${session.stageNumber}, ${AppStrings.gameTime}: ${formatDuration(session.playingTime,Get.locale!.languageCode)}'),
                trailing: Icon(Icons.comment_bank_outlined),
              ),
            );
          },
        ),
      ),
    );
  }
}
