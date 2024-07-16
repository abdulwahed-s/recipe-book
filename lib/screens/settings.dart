// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:food_recipe/controllers/homecontroller.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Homecontroller _homecontroller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontFamily: 'taj',
          ),
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Change thame",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'taj', fontSize: 28),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: DayNightSwitch(
                    value: _homecontroller.IsDark.value,
                    onChanged: (value) {
                      _homecontroller.changeThame(value);
                    },
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: ExpansionTile(
                  title: Container(
                    child: Text(
                      "diet setting",
                      style: TextStyle(
                        fontFamily: 'taj',
                      ),
                    ),
                  ),
                  children: [
                    CheckboxListTile(
                      value: _homecontroller.dietBalanced.value,
                      onChanged: (value) {
                        _homecontroller.dietBalanced.value = value!;
                      },
                      title: Text(
                        "balanced",
                        style: TextStyle(
                            fontFamily: 'taj',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: _homecontroller.dietHighFiber.value,
                      onChanged: (value) {
                        _homecontroller.dietHighFiber.value = value!;
                      },
                      title: Text(
                        "high fiber",
                        style: TextStyle(
                            fontFamily: 'taj',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: _homecontroller.dietHighProtein.value,
                      onChanged: (value) {
                        _homecontroller.dietHighProtein.value = value!;
                      },
                      title: Text(
                        "high protein",
                        style: TextStyle(
                            fontFamily: 'taj',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: _homecontroller.dietLowCarb.value,
                      onChanged: (value) {
                        _homecontroller.dietLowCarb.value = value!;
                      },
                      title: Text(
                        "low carb",
                        style: TextStyle(
                            fontFamily: 'taj',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: _homecontroller.dietLowFat.value,
                      onChanged: (value) {
                        _homecontroller.dietLowFat.value = value!;
                      },
                      title: Text(
                        "low fat",
                        style: TextStyle(
                            fontFamily: 'taj',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: _homecontroller.dietLowSodium.value,
                      onChanged: (value) {
                        _homecontroller.dietLowSodium.value = value!;
                      },
                      title: Text(
                        "low sodium",
                        style: TextStyle(
                            fontFamily: 'taj',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                )),
            Container(
              child: ExpansionTile(
                title: Container(
                  child: Text(
                    "health",
                    style: TextStyle(
                      fontFamily: 'taj',
                    ),
                  ),
                ),
                children: [
                  CheckboxListTile(
                    value: _homecontroller.healthAlcoholCocktail.value,
                    onChanged: (value) {
                      _homecontroller.healthAlcoholCocktail.value = value!;
                    },
                    title: Text(
                      "alcohol cocktail",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthAlcoholFree.value,
                    onChanged: (value) {
                      _homecontroller.healthAlcoholFree.value = value!;
                    },
                    title: Text(
                      "alcohol free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthCeleryFree.value,
                    onChanged: (value) {
                      _homecontroller.healthCeleryFree.value = value!;
                    },
                    title: Text(
                      "celery free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthCrustaceanFree.value,
                    onChanged: (value) {
                      _homecontroller.healthCrustaceanFree.value = value!;
                    },
                    title: Text(
                      "crustacean free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthDASH.value,
                    onChanged: (value) {
                      _homecontroller.healthDASH.value = value!;
                    },
                    title: Text(
                      "DASH",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthDairyFree.value,
                    onChanged: (value) {
                      _homecontroller.healthDairyFree.value = value!;
                    },
                    title: Text(
                      "dairy free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthEggFree.value,
                    onChanged: (value) {
                      _homecontroller.healthEggFree.value = value!;
                    },
                    title: Text(
                      "egg free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthFODMAPFree.value,
                    onChanged: (value) {
                      _homecontroller.healthFODMAPFree.value = value!;
                    },
                    title: Text(
                      "FODMAP free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthFishFree.value,
                    onChanged: (value) {
                      _homecontroller.healthFishFree.value = value!;
                    },
                    title: Text(
                      "fish free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthGlutenFree.value,
                    onChanged: (value) {
                      _homecontroller.healthGlutenFree.value = value!;
                    },
                    title: Text(
                      "gluten free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthImmunoSupportive.value,
                    onChanged: (value) {
                      _homecontroller.healthImmunoSupportive.value = value!;
                    },
                    title: Text(
                      "immuno supportive",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthKetoFriendly.value,
                    onChanged: (value) {
                      _homecontroller.healthKetoFriendly.value = value!;
                    },
                    title: Text(
                      "keto friendly",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthKidneyFriendly.value,
                    onChanged: (value) {
                      _homecontroller.healthKidneyFriendly.value = value!;
                    },
                    title: Text(
                      "kidney friendly",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthKosher.value,
                    onChanged: (value) {
                      _homecontroller.healthKosher.value = value!;
                    },
                    title: Text(
                      "kosher",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthLowPotassium.value,
                    onChanged: (value) {
                      _homecontroller.healthLowPotassium.value = value!;
                    },
                    title: Text(
                      "low potassium",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthLowSugar.value,
                    onChanged: (value) {
                      _homecontroller.healthLowSugar.value = value!;
                    },
                    title: Text(
                      "low sugar",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthLupineFree.value,
                    onChanged: (value) {
                      _homecontroller.healthLupineFree.value = value!;
                    },
                    title: Text(
                      "lupine free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthMediterranean.value,
                    onChanged: (value) {
                      _homecontroller.healthMediterranean.value = value!;
                    },
                    title: Text(
                      "mediterranean",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthMolluskFree.value,
                    onChanged: (value) {
                      _homecontroller.healthMolluskFree.value = value!;
                    },
                    title: Text(
                      "mollusk free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthMustardFree.value,
                    onChanged: (value) {
                      _homecontroller.healthMustardFree.value = value!;
                    },
                    title: Text(
                      "mustard free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthNoOilAdded.value,
                    onChanged: (value) {
                      _homecontroller.healthNoOilAdded.value = value!;
                    },
                    title: Text(
                      "no oil added",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthPaleo.value,
                    onChanged: (value) {
                      _homecontroller.healthPaleo.value = value!;
                    },
                    title: Text(
                      "paleo",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthPeanutFree.value,
                    onChanged: (value) {
                      _homecontroller.healthPeanutFree.value = value!;
                    },
                    title: Text(
                      "peanut free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthPescatarian.value,
                    onChanged: (value) {
                      _homecontroller.healthPescatarian.value = value!;
                    },
                    title: Text(
                      "pescatarian",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthPorkFree.value,
                    onChanged: (value) {
                      _homecontroller.healthPorkFree.value = value!;
                    },
                    title: Text(
                      "pork free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthRedMeatFree.value,
                    onChanged: (value) {
                      _homecontroller.healthRedMeatFree.value = value!;
                    },
                    title: Text(
                      "red meat free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthSesameFree.value,
                    onChanged: (value) {
                      _homecontroller.healthSesameFree.value = value!;
                    },
                    title: Text(
                      "sesame free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthShellfishFree.value,
                    onChanged: (value) {
                      _homecontroller.healthShellfishFree.value = value!;
                    },
                    title: Text(
                      "shellfish free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthSoyFree.value,
                    onChanged: (value) {
                      _homecontroller.healthSoyFree.value = value!;
                    },
                    title: Text(
                      "soy free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthSugarConscious.value,
                    onChanged: (value) {
                      _homecontroller.healthSugarConscious.value = value!;
                    },
                    title: Text(
                      "sugar conscious",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthSulfiteFree.value,
                    onChanged: (value) {
                      _homecontroller.healthSulfiteFree.value = value!;
                    },
                    title: Text(
                      "sulfite free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthTreeNutFree.value,
                    onChanged: (value) {
                      _homecontroller.healthTreeNutFree.value = value!;
                    },
                    title: Text(
                      "tree nut free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthVegan.value,
                    onChanged: (value) {
                      _homecontroller.healthVegan.value = value!;
                    },
                    title: Text(
                      "vegan",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthVegetarian.value,
                    onChanged: (value) {
                      _homecontroller.healthVegetarian.value = value!;
                    },
                    title: Text(
                      "vegetarian",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  CheckboxListTile(
                    value: _homecontroller.healthWheatFree.value,
                    onChanged: (value) {
                      _homecontroller.healthWheatFree.value = value!;
                    },
                    title: Text(
                      "wheat free",
                      style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),

            AnimatedButton.strip(
                isReverse: true,
                backgroundColor: Color.fromARGB(255, 44, 63, 90),
                selectedBackgroundColor: _homecontroller.IsDark.value
                    ? Colors.black
                    : Color.fromARGB(255, 229, 219, 255),
                stripColor: _homecontroller.IsDark.value
                    ? Colors.black
                    : Color.fromARGB(255, 229, 219, 255),
                textStyle: TextStyle(fontFamily: 'taj', fontSize: 20),
                text: "Save",
                onPress: () {
                  _homecontroller.SaveSetting();
                  Flushbar(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  backgroundColor:_homecontroller.IsDark.value
               ? Colors.grey.shade800
                    : Color.fromARGB(255, 196, 211, 255), 
                    duration: Duration(seconds: 3),
                    messageText: Text(
                  "Settings have been saved",
                  style: TextStyle(
                    color: _homecontroller.IsDark.value
                        ? Color.fromARGB(255, 187, 191, 255)
                        : Color.fromARGB(255, 16, 15, 27),
                    fontWeight: FontWeight.bold,
                    fontFamily: "taj",
                  ),
                ),
            ).show(context);
                })
          ],
        ),
      ),
    );
  }
}
