import 'dart:io';

import 'package:get/state_manager.dart';

class DataController extends GetxController {
  RxList generatedNumbers = [].obs;
  RxString message = "".obs;

  void generateNumbers() async {
    ProcessResult result =
        await Process.run('python', ['assets/random_generate.py']);
    String output = result.stdout as String;
    List<String> numbersStr = output.trim().split('\n');
    generatedNumbers.value = numbersStr;
    update();
  }

  void getMessage() async {
    ProcessResult result = await Process.run('python', ['assets/script2.py']);
    String output = result.stdout as String;
    List<String> trim = output.trim().split('\n');
    message.value = trim[0];
    update();
  }
}
