import 'package:get/get.dart';

class SidebarController extends GetxController {
  var selectedIndex = 0.obs;

  void changePageIndex(int index) {
    selectedIndex.value = index;
  }
}