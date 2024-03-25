import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer.dart';
import 'package:let_s_have_fun/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/controller/exercise_controller.dart';
import 'package:let_s_have_fun/presentation/admin/exercies_management/model/level.dart';

import '../../../../core/app_export.dart';
import '../model/game.dart';

class GameController extends GetxController {
  TextEditingController questionController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  TextEditingController successMessageController = TextEditingController();
    Rx<Level?> currentLevel = Rx<Level?>(null);
    Rx<FlowState>  state = Rx<FlowState>(EmptyState(AppStrings.chooseLevelOrEx));
    Color? color ;
   getLevel(Level level){
    currentLevel.value= level;
    color = Get.find<ExerciseController>().exercises.firstWhere((element) => element.id==level.exerciseId).color;
    state.value= ContentState();
   }


  List<TextEditingController> imgsAnswerControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<RxBool> isImgSelected = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];

  checkImgSelected(int index) {
    // Count the number of selected images
    int selectedCount = isImgSelected.where((rxBool) => rxBool.value).length;

    if(imgsAnswerControllers[index].text.isNotEmpty) {
      // Check if the maximum limit is reached (2)
    if (isImgSelected[index].value || selectedCount < 2) {
      isImgSelected[index].value = !isImgSelected[index].value;
    }
    }
  }

  clearForm(int index){
    imgsAnswerControllers[index].clear();
   }
  getImage(int index) async {
     imgsAnswerControllers[index].text =(await _pickImage())?.name??'';
  }

  Future<XFile?> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      // or use ImageSource.camera to capture a new photo

      if (image == null) return null; // User canceled the picker

      return image;
      // File(image.path)
    } catch (e) {
      // Handle the exception
      print("Error picking image: $e");
    }
    return null;
  }

  saveGame() {
    Game game = Game(
        question: questionController.text,
        imgsAnswer: imgsAnswerControllers.map((e) => e.text).toList(),
        img: imgController.text ,
    );

    currentLevel.value?.games?.add(game);
   }


}
