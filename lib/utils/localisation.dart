import 'package:get/get.dart';

class LocaleController extends GetxController {
  var locale = 'en'.obs;

  void changeLocale(String newLocale) {
    locale.value = newLocale;
    update();
  }
}
