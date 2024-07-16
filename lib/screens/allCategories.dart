// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/homecontroller.dart';
import 'package:get/get.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final Homecontroller _homecontroller = Get.find();
    return Scaffold(
      appBar: AppBar(
      title:  Text(
                    "categories",
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'taj',
                        fontWeight: FontWeight.w500),
                  ),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
             
                
                ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed("/typeMenu",
                      arguments: _homecontroller.categories[index]
                          ['name']);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              const Color.fromARGB(174, 0, 0, 0),
                              BlendMode.darken),
                          image: AssetImage(
                              _homecontroller.categories[index]['img']))),
                  child: Center(
                      child: Text(
                    _homecontroller.categories[index]['name'],
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontFamily: 'taj',
                        fontWeight: FontWeight.w500),
                  )),
                ),
              );
            },
            itemCount: _homecontroller.categories.length,
          ),
        ),
      ),
    );
  }
}
