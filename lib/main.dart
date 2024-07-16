// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_recipe/screens/allCategories.dart';
import 'package:food_recipe/screens/favorite.dart';
import 'package:food_recipe/screens/homepage.dart';
import 'package:food_recipe/screens/navBar.dart';
import 'package:food_recipe/screens/recipepage.dart';
import 'package:food_recipe/screens/typeMenu.dart';
import 'package:food_recipe/services/binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await GetStorage.init();

  // Function to check and set the system theme
  void checkSystemTheme() {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    // If no theme is set in storage, set it based on system theme
    if (GetStorage().read("isdark") == null) {
      GetStorage().write("isdark", isDarkMode);
      GetStorage().save();
    }
  }

  // Call the function to check and set the system theme
  checkSystemTheme();

  // Read the theme from storage
  bool isDark = GetStorage().read("isdark") ?? false;
    runApp(MyApp(isDark: isDark,));
}
class MyApp extends StatelessWidget {
final bool isDark;
  const MyApp({super.key,required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: isDark?ThemeData.dark():ThemeData.light(),
    initialBinding: Mybinding(),
      initialRoute: "/",
      getPages: [
      GetPage(name: "/", page: () => NavBar()),
      GetPage(name: "/homepage", page: () => HomePage())
      ,GetPage(name: "/recipe", page:()=> Recipe()),
      GetPage(name: "/AllCategories", page: () => AllCategories(),),
      GetPage(name: "/favorite", page:() => Favorite()),
      GetPage(name: "/typeMenu", page: () => TpyeMenu(),),
      
      ],
    );
  }
}
