import 'package:food_recipe/controllers/categoriescontroller.dart';
import 'package:food_recipe/controllers/homecontroller.dart';
import 'package:food_recipe/controllers/recipepagecontroller.dart';
import 'package:get/get.dart';

class Mybinding implements Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => Homecontroller(),fenix: true);
  Get.lazyPut(() => recipeController(),fenix: true);
  Get.lazyPut(() => categoriesController(),fenix: true);
  }

}