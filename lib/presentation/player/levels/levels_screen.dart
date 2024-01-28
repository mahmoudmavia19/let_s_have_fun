import 'package:flutter/material.dart';
import 'package:let_s_have_fun/presentation/play_area.dart';
import 'package:let_s_have_fun/widgets/level_item.dart';
import '../../admin/exercies_management/model/Exercise.dart';

class LevelsScreen extends StatelessWidget {
  Exercise exercise;

  LevelsScreen(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SizedBox(
          width: 430,
          height: 1068,
          child: Stack(
            children: [
              PlayArea(exercise.color!),
              Padding(padding: EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(exercise.title,style: TextStyle(
                              fontSize: 24 ,
                              fontWeight: FontWeight.bold ,
                              color: Colors.white
                          ), ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: exercise.levels?.length,
                          itemBuilder: (itemContext , index){
                            return
                            index%2==0 ?
                              LevelItem(exercise.levels![index],exercise.color!) :
                             LevelItem2(exercise.levels![index],exercise.color!);
                      })
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
