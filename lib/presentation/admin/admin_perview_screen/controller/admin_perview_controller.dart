import 'package:flutter_tts/flutter_tts.dart';

import '../../../../core/app_export.dart';

class AdminPerViewController extends GetxController {
  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() {
    super.onInit();
    initTts();
  }

  initTts() async {
    List<dynamic> voices = await flutterTts.getVoices;
    print(voices);


    await flutterTts.setLanguage("ar-SA"); // Arabic Saudi Arabia
    await flutterTts.setVoice({
      "name": "ar-xa-x-arc-network",
      "locale": "ar"
    });
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }
}