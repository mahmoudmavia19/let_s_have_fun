import 'package:flutter/material.dart';
import 'package:let_s_have_fun/presentation/another_screen/play_area.dart';
import 'package:let_s_have_fun/widgets/level_item.dart';
import '../../../core/app_export.dart';
import '../../doctor/exercies_management/model/Exercise.dart';

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
                    Row(
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
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(onPressed: (){
                              Get.back();
                            }, icon: Icon(Icons.home,color: Colors.red,)),
                          ),
                        ),
                      ],
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child:Align(
                    alignment:Alignment.topRight,
                    child: Container(
                        height: 70,
                        width: 70,
                        child: Image.asset(ImageConstant.puzzle_logo))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
