// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_recipe/services/Recipeapi.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

class Homecontroller extends GetxController {
  RxMap<dynamic, dynamic> Products = {}.obs;
  RxList MyFavorites = [].obs;
  RxBool IsDark = false.obs;
  // Diet Labels
  RxBool dietBalanced = false.obs;
  RxBool dietHighFiber = false.obs;
  RxBool dietHighProtein = false.obs;
  RxBool dietLowCarb = false.obs;
  RxBool dietLowFat = false.obs;
  RxBool dietLowSodium = false.obs;

// Health Labels
  RxBool healthAlcoholCocktail = false.obs;
  RxBool healthAlcoholFree = false.obs;
  RxBool healthCeleryFree = false.obs;
  RxBool healthCrustaceanFree = false.obs;
  RxBool healthDairyFree = false.obs;
  RxBool healthDASH = false.obs;
  RxBool healthEggFree = false.obs;
  RxBool healthFishFree = false.obs;
  RxBool healthFODMAPFree = false.obs;
  RxBool healthGlutenFree = false.obs;
  RxBool healthImmunoSupportive = false.obs;
  RxBool healthKetoFriendly = false.obs;
  RxBool healthKidneyFriendly = false.obs;
  RxBool healthKosher = false.obs;
  RxBool healthLowPotassium = false.obs;
  RxBool healthLowSugar = false.obs;
  RxBool healthLupineFree = false.obs;
  RxBool healthMediterranean = false.obs;
  RxBool healthMolluskFree = false.obs;
  RxBool healthMustardFree = false.obs;
  RxBool healthNoOilAdded = false.obs;
  RxBool healthPaleo = false.obs;
  RxBool healthPeanutFree = false.obs;
  RxBool healthPescatarian = false.obs;
  RxBool healthPorkFree = false.obs;
  RxBool healthRedMeatFree = false.obs;
  RxBool healthSesameFree = false.obs;
  RxBool healthShellfishFree = false.obs;
  RxBool healthSoyFree = false.obs;
  RxBool healthSugarConscious = false.obs;
  RxBool healthSulfiteFree = false.obs;
  RxBool healthTreeNutFree = false.obs;
  RxBool healthVegan = false.obs;
  RxBool healthVegetarian = false.obs;
  RxBool healthWheatFree = false.obs;
  RxBool loding = false.obs;
  RxList categories = [
    {'name': 'arabic', 'img': 'images/arabic.png'},
    {'name': 'pasta', 'img': 'images/pasta.jpg'},
    {'name': 'burger', 'img': 'images/burger.jpg'},
    {'name': 'pizza', 'img': 'images/pizza.jpg'},
    {'name': 'cinnamon rolls','img':'images/cinnamoroll.jpg'},
    {'name':'fattoush','img':'images/fattoush.jpg'},
    {'name':'syrian','img':'images/syrian.jpg'},
    {'name': 'sandwich', 'img': 'images/sandwich.jpg'},
    {'name':'algerian','img':'images/algerian.png'},
    {'name':'spanish','img':'images/spain.png'},
    
    
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    loding.value = true;
    IsDark.value = GetStorage().read("isdark") ?? false;

    var f = GetStorage().read("favorites");

    if (f != null) {
      MyFavorites.value = f;
    }

    var dietsettings = GetStorage().read('DietSettings');

    if (dietsettings == null) {
      GetStorage().write('DietSettings', {
        "dietBalanced": false,
        "dietHighFiber": false,
        "dietHighProtein": false,
        "dietLowCarb": false,
        "dietLowFat": false,
        "dietLowSodium": false,
      });
    } else {
      dietBalanced.value = dietsettings["dietBalanced"];
      dietHighFiber.value = dietsettings["dietHighFiber"];
      dietHighProtein.value = dietsettings["dietHighProtein"];
      dietLowCarb.value = dietsettings["dietLowCarb"];
      dietLowFat.value = dietsettings["dietLowFat"];
      dietLowSodium.value = dietsettings["dietLowSodium"];
    }

    var Healthsettings = GetStorage().read('healthsettings');

    if (Healthsettings == null) {
      GetStorage().write('healthsettings', {
        "healthAlcoholCocktail": false,
        "healthAlcoholFree": false,
        "healthCeleryFree": false,
        "healthCrustaceanFree": false,
        "healthDairyFree": false,
        "healthDASH": false,
        "healthEggFree": false,
        "healthFishFree": false,
        "healthFODMAPFree": false,
        "healthGlutenFree": false,
        "healthImmunoSupportive": false,
        "healthKetoFriendly": false,
        "healthKidneyFriendly": false,
        "healthKosher": false,
        "healthLowPotassium": false,
        "healthLowSugar": false,
        "healthLupineFree": false,
        "healthMediterranean": false,
        "healthMolluskFree": false,
        "healthMustardFree": false,
        "healthNoOilAdded": false,
        "healthPaleo": false,
        "healthPeanutFree": false,
        "healthPescatarian": false,
        "healthPorkFree": false,
        "healthRedMeatFree": false,
        "healthSesameFree": false,
        "healthShellfishFree": false,
        "healthSoyFree": false,
        "healthSugarConscious": false,
        "healthSulfiteFree": false,
        "healthTreeNutFree": false,
        "healthVegan": false,
        "healthVegetarian": false,
        "healthWheatFree": false,
      });
    } else {
      healthAlcoholCocktail.value = Healthsettings["healthAlcoholCocktail"];
      healthAlcoholFree.value = Healthsettings["healthAlcoholFree"];
      healthCeleryFree.value = Healthsettings["healthCeleryFree"];
      healthCrustaceanFree.value = Healthsettings["healthCrustaceanFree"];
      healthDairyFree.value = Healthsettings["healthDairyFree"];
      healthDASH.value = Healthsettings["healthDASH"];
      healthEggFree.value = Healthsettings["healthEggFree"];
      healthFishFree.value = Healthsettings["healthFishFree"];
      healthFODMAPFree.value = Healthsettings["healthFODMAPFree"];
      healthGlutenFree.value = Healthsettings["healthGlutenFree"];
      healthKetoFriendly.value = Healthsettings["healthKetoFriendly"];
      healthKidneyFriendly.value = Healthsettings["healthKidneyFriendly"];
      healthKosher.value = Healthsettings["healthKosher"];
      healthLowPotassium.value = Healthsettings["healthLowPotassium"];
      healthLowSugar.value = Healthsettings["healthLowSugar"];
      healthLupineFree.value = Healthsettings["healthLupineFree"];
      healthMustardFree.value = Healthsettings["healthMustardFree"];
      healthNoOilAdded.value = Healthsettings["healthNoOilAdded"];
      healthPaleo.value = Healthsettings["healthPaleo"];
      healthPeanutFree.value = Healthsettings["healthPeanutFree"];
      healthPescatarian.value = Healthsettings["healthPescatarian"];
      healthPorkFree.value = Healthsettings["healthPorkFree"];
      healthRedMeatFree.value = Healthsettings["healthRedMeatFree"];
      healthSesameFree.value = Healthsettings["healthSesameFree"];
      healthShellfishFree.value = Healthsettings["healthShellfishFree"];
      healthSoyFree.value = Healthsettings["healthSoyFree"];
      healthSulfiteFree.value = Healthsettings["healthSulfiteFree"];
      healthTreeNutFree.value = Healthsettings["healthTreeNutFree"];
      healthVegan.value = Healthsettings["healthVegan"];
      healthVegetarian.value = Healthsettings["healthVegetarian"];
      healthWheatFree.value = Healthsettings["healthWheatFree"];
      healthMediterranean.value = Healthsettings["healthMediterranean"];
      healthMolluskFree.value = Healthsettings["healthMolluskFree"];
      healthSugarConscious.value = Healthsettings["healthSugarConscious"];
      healthImmunoSupportive.value = Healthsettings["healthImmunoSupportive"];
    }
    GetStorage().save();

    getRandomRecipes().then((value) => {Products.value = value});
    loding.value = false;
    refresh();
  }

  void RemoveFromFavorites(Map<dynamic, dynamic> recipe) {
    {
      MyFavorites.remove(recipe);
      GetStorage().write("favorites", MyFavorites);
      GetStorage().save();
    }
  }

  void AddToFavorites(Map<dynamic, dynamic> recipe) {
    MyFavorites.add(recipe);
    GetStorage().write("favorites", MyFavorites);
    GetStorage().save();
  }

  void changeThame(bool value) {
    GetStorage().write("isdark", value);
    GetStorage().save();
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    Get.changeTheme(GetStorage().read('isdark') == true
        ? ThemeData.dark()
        : ThemeData.light());
    IsDark.value = value;
    
  }

  void SaveSetting() {
    GetStorage().write('DietSettings', {
      "dietBalanced": dietBalanced.value,
      "dietHighFiber": dietHighFiber.value,
      "dietHighProtein": dietHighProtein.value,
      "dietLowCarb": dietLowCarb.value,
      "dietLowFat": dietLowFat.value,
      "dietLowSodium": dietLowSodium.value,
    });
    GetStorage().write('healthsettings', {
      "healthAlcoholCocktail": healthAlcoholCocktail.value,
      "healthAlcoholFree": healthAlcoholFree.value,
      "healthCeleryFree": healthCeleryFree.value,
      "healthCrustaceanFree": healthCrustaceanFree.value,
      "healthDairyFree": healthDairyFree.value,
      "healthDASH": healthDASH.value,
      "healthEggFree": healthEggFree.value,
      "healthFishFree": healthFishFree.value,
      "healthFODMAPFree": healthFODMAPFree.value,
      "healthGlutenFree": healthGlutenFree.value,
      "healthImmunoSupportive": healthImmunoSupportive.value,
      "healthKetoFriendly": healthKetoFriendly.value,
      "healthKidneyFriendly": healthKidneyFriendly.value,
      "healthKosher": healthKosher.value,
      "healthLowPotassium": healthLowPotassium.value,
      "healthLowSugar": healthLowSugar.value,
      "healthLupineFree": healthLupineFree.value,
      "healthMediterranean": healthMediterranean.value,
      "healthMolluskFree": healthMolluskFree.value,
      "healthMustardFree": healthMustardFree.value,
      "healthNoOilAdded": healthNoOilAdded.value,
      "healthPaleo": healthPaleo.value,
      "healthPeanutFree": healthPeanutFree.value,
      "healthPescatarian": healthPescatarian.value,
      "healthPorkFree": healthPorkFree.value,
      "healthRedMeatFree": healthRedMeatFree.value,
      "healthSesameFree": healthSesameFree.value,
      "healthShellfishFree": healthShellfishFree.value,
      "healthSoyFree": healthSoyFree.value,
      "healthSugarConscious": healthSugarConscious.value,
      "healthSulfiteFree": healthSulfiteFree.value,
      "healthTreeNutFree": healthTreeNutFree.value,
      "healthVegan": healthVegan.value,
      "healthVegetarian": healthVegetarian.value,
      "healthWheatFree": healthWheatFree.value,
    });
    GetStorage().save();
    update();
    refresh();
  }

  Future<void> refresh() {
    loding.value = true;
    IsDark.value = GetStorage().read("isdark") ?? false;


    var dietsettings = GetStorage().read('DietSettings');

    if (dietsettings == null) {
      GetStorage().write('DietSettings', {
        "dietBalanced": false,
        "dietHighFiber": false,
        "dietHighProtein": false,
        "dietLowCarb": false,
        "dietLowFat": false,
        "dietLowSodium": false,
      });
    } else {
      dietBalanced.value = dietsettings["dietBalanced"];
      dietHighFiber.value = dietsettings["dietHighFiber"];
      dietHighProtein.value = dietsettings["dietHighProtein"];
      dietLowCarb.value = dietsettings["dietLowCarb"];
      dietLowFat.value = dietsettings["dietLowFat"];
      dietLowSodium.value = dietsettings["dietLowSodium"];
    }

    var Healthsettings = GetStorage().read('healthsettings');

    if (Healthsettings == null) {
      GetStorage().write('healthsettings', {
        "healthAlcoholCocktail": false,
        "healthAlcoholFree": false,
        "healthCeleryFree": false,
        "healthCrustaceanFree": false,
        "healthDairyFree": false,
        "healthDASH": false,
        "healthEggFree": false,
        "healthFishFree": false,
        "healthFODMAPFree": false,
        "healthGlutenFree": false,
        "healthImmunoSupportive": false,
        "healthKetoFriendly": false,
        "healthKidneyFriendly": false,
        "healthKosher": false,
        "healthLowPotassium": false,
        "healthLowSugar": false,
        "healthLupineFree": false,
        "healthMediterranean": false,
        "healthMolluskFree": false,
        "healthMustardFree": false,
        "healthNoOilAdded": false,
        "healthPaleo": false,
        "healthPeanutFree": false,
        "healthPescatarian": false,
        "healthPorkFree": false,
        "healthRedMeatFree": false,
        "healthSesameFree": false,
        "healthShellfishFree": false,
        "healthSoyFree": false,
        "healthSugarConscious": false,
        "healthSulfiteFree": false,
        "healthTreeNutFree": false,
        "healthVegan": false,
        "healthVegetarian": false,
        "healthWheatFree": false,
      });
    } else {
      healthAlcoholCocktail.value = Healthsettings["healthAlcoholCocktail"];
      healthAlcoholFree.value = Healthsettings["healthAlcoholFree"];
      healthCeleryFree.value = Healthsettings["healthCeleryFree"];
      healthCrustaceanFree.value = Healthsettings["healthCrustaceanFree"];
      healthDairyFree.value = Healthsettings["healthDairyFree"];
      healthDASH.value = Healthsettings["healthDASH"];
      healthEggFree.value = Healthsettings["healthEggFree"];
      healthFishFree.value = Healthsettings["healthFishFree"];
      healthFODMAPFree.value = Healthsettings["healthFODMAPFree"];
      healthGlutenFree.value = Healthsettings["healthGlutenFree"];
      healthKetoFriendly.value = Healthsettings["healthKetoFriendly"];
      healthKidneyFriendly.value = Healthsettings["healthKidneyFriendly"];
      healthKosher.value = Healthsettings["healthKosher"];
      healthLowPotassium.value = Healthsettings["healthLowPotassium"];
      healthLowSugar.value = Healthsettings["healthLowSugar"];
      healthLupineFree.value = Healthsettings["healthLupineFree"];
      healthMustardFree.value = Healthsettings["healthMustardFree"];
      healthNoOilAdded.value = Healthsettings["healthNoOilAdded"];
      healthPaleo.value = Healthsettings["healthPaleo"];
      healthPeanutFree.value = Healthsettings["healthPeanutFree"];
      healthPescatarian.value = Healthsettings["healthPescatarian"];
      healthPorkFree.value = Healthsettings["healthPorkFree"];
      healthRedMeatFree.value = Healthsettings["healthRedMeatFree"];
      healthSesameFree.value = Healthsettings["healthSesameFree"];
      healthShellfishFree.value = Healthsettings["healthShellfishFree"];
      healthSoyFree.value = Healthsettings["healthSoyFree"];
      healthSulfiteFree.value = Healthsettings["healthSulfiteFree"];
      healthTreeNutFree.value = Healthsettings["healthTreeNutFree"];
      healthVegan.value = Healthsettings["healthVegan"];
      healthVegetarian.value = Healthsettings["healthVegetarian"];
      healthWheatFree.value = Healthsettings["healthWheatFree"];
      healthMediterranean.value = Healthsettings["healthMediterranean"];
      healthMolluskFree.value = Healthsettings["healthMolluskFree"];
      healthSugarConscious.value = Healthsettings["healthSugarConscious"];
      healthImmunoSupportive.value = Healthsettings["healthImmunoSupportive"];
    }
    GetStorage().save();
    
    loding.value = false;

    return getRandomRecipes().then((value) => {Products.value = value});
  }
}
