import 'package:get/get.dart';

class ValueController extends GetxController {
  RxInt maoney = 0.obs;

  void changeValue(int newValue) {
    maoney.value = newValue;
  }
}