import 'package:food_recipe/services/Recipeapi.dart';
import 'package:get/get.dart';

class categoriesController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxBool loading = false.obs;

  RxMap<dynamic, dynamic> MyProducts = {}.obs;

  @override
  void onInit() {
    super.onInit();

    loading.value = true;

    getRecipe(argumentData).then((value) {
      MyProducts.value = value;
      loading.value = false;
    });
  }

  void GetMoreByUri(String uri) {
    getRecipeByUri(uri).then((value) => {
          MyProducts['hits'].addAll(value['hits']),
          MyProducts['_links'] = value['_links'],
        });
  }
}
