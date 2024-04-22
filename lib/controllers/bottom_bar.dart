import 'package:get/get.dart';

class bottomController extends GetxController {
  RxInt currentindex = 0.obs;
  void setvalue(int index) {
    currentindex.value = index;
    update();
  }
}

class tabsController extends GetxController {
  RxString currentindex = "".obs;
  void setvalue(String index) {
    currentindex.value = index;
    update();
  }
}
