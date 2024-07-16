import 'package:get/get.dart';

class recipeController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxList MyFavorites = [].obs;

  @override
  void onInit() {
    super.onInit();
  }
  

  bool rey = true;
  void moreInfo() {
    rey = false;
    update();
  }
}
