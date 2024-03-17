import 'package:flutter/material.dart';
import 'package:let_s_have_fun/core/utils/color_constant.dart';
import 'package:let_s_have_fun/presentation/player/player_records/controller/play_history_user_controller.dart';

import '../../../core/app_export.dart';
import '../../../core/constant/constant.dart';
import '../../../core/utils/app_strings.dart';

class PlayerRecords extends StatelessWidget {
  final PlayerRecordsController playHistoryController = Get.find();

  PlayerRecords(); //


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: Row(
          children: [
            Image.asset(ImageConstant.puzzle_logo,width: 50,height: 50,),
            Text(AppStrings.playHistory),
          ],
        ),
        leading:  Container(),
        centerTitle: false,
        leadingWidth: 2.0,
        actions: [
          Icon(Icons.score),
          Text(playHistoryController.totalScore(playHistoryController.playHistory.length-1).toString(),
          style: TextStyle(color: Colors.white,fontSize: 16),),
          SizedBox(width: 10,),
          Icon(Icons.timer),
          Text(formatDuration(playHistoryController.totalTime(playHistoryController.playHistory.length-1),Get.locale!.languageCode),
          style: TextStyle(color: Colors.white,fontSize: 16),),
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
                title: Text('${AppStrings.level}:${convertToArabicWords(session.levelNumber.toString())},${AppStrings.points}: ${session.levelPoints}'),
                subtitle: Text('${AppStrings.regameCount}: ${session.stageNumber}, ${AppStrings.gameTime}: ${formatDuration(session.playingTime,Get.locale!.languageCode)}'),
                trailing: Column(
                  children: [
                    Text('${AppStrings.score}',style: TextStyle(color: ColorConstant.primary,fontSize: 16),),
                    Text('${playHistoryController.totalScore(index)}',style: TextStyle(color: ColorConstant.primary,fontSize: 16.0),),
                  ]
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
