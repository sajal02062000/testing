import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/state_manager.dart';

class DataController extends GetxController {
  RxList generatedNumbers = [].obs;
  RxString message = "".obs;

  Future generateNumbers() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/random_numbers/');
    var response = await http.get(url);
    String out = jsonDecode(jsonEncode(response.body))
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .replaceAll(']', '')
        .replaceAll('[', '')
        .replaceAll(':', '')
        .replaceAll('"numbers"', '')
        .replaceAll(' ', '');
    List output = out.split(',');
    generatedNumbers.value = output.toList();
    update();
  }
}
