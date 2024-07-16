// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/homecontroller.dart';
import 'package:food_recipe/controllers/recipepagecontroller.dart';
import 'package:get/get.dart';

class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    recipeController _recipeController = Get.find();
    Homecontroller _homecontroller = Get.find();
    return Scaffold(
        floatingActionButton: FavoriteButton(
            isFavorite: _homecontroller.MyFavorites.contains(
                _recipeController.argumentData),
            valueChanged: (t) {
              _homecontroller.MyFavorites.contains(
                      _recipeController.argumentData)
                  ? _homecontroller.RemoveFromFavorites(
                      _recipeController.argumentData)
                  : _homecontroller.AddToFavorites(
                      _recipeController.argumentData);
            }),
        appBar: AppBar(
          title: Text(
            _recipeController.argumentData['recipe']['label'],
            style: TextStyle(
                color: _homecontroller.IsDark.value
                    ? Color.fromARGB(255, 187, 191, 255)
                    : Color.fromARGB(255, 16, 15, 27),
                fontFamily: "taj"),
          ),
        ),
        body: SafeArea(
            child: Scrollbar(
                child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 148, 29, 29),
                          blurRadius: 10),
                    ],
                  ),
                  child: Image.network(
                    _recipeController.argumentData['recipe']['images']
                        ['REGULAR']['url'],
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "images/error.png",
                        fit: BoxFit.cover,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 10),
                child: Text(
                  "ingredient",
                  style: TextStyle(
                      fontFamily: 'taj', fontSize: 18,),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(
                        (index + 1).toString() +
                            "-" +
                            _recipeController.argumentData['recipe']
                                ['ingredientLines'][index],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'taj',
                            fontSize: 15,
                            color:_homecontroller.IsDark.value? Color.fromARGB(255, 225, 255, 252): Color.fromARGB(255, 22, 53, 50)),
                      );
                    },
                    itemCount: _recipeController
                        .argumentData['recipe']['ingredientLines'].length,
                  )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: GetBuilder<recipeController>(
                  builder: (controller) {
                    return controller.rey
                        ? GestureDetector(
                            onTap: () {
                              controller.moreInfo();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "click here to see more information about this recipe",
                                style: TextStyle(
                                    fontFamily: 'taj',
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 214, 0, 82)),
                              ),
                            ))
                        : Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "total time to make this recipe (not accurate)",
                                      style: TextStyle(
                                          fontFamily: 'taj',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color:
                                              _homecontroller.IsDark.value? Color.fromARGB(255, 102, 184, 175):Color.fromARGB(255, 45, 66, 64)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    _recipeController.argumentData['recipe']
                                                ['totalTime']
                                            .toString() +
                                        (" min"),
                                    style: TextStyle(
                                        fontFamily: 'taj',
                                        fontSize: 15,
                                        color: _homecontroller.IsDark.value? Color.fromARGB(255, 225, 255, 252): Color.fromARGB(255, 22, 53, 50)),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "total calories in this recipe",
                                      style: TextStyle(
                                          fontFamily: 'taj',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color:
                                              _homecontroller.IsDark.value? Color.fromARGB(255, 102, 184, 175):Color.fromARGB(255, 45, 66, 64)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, bottom: 5),
                                  child: Text(
                                    _recipeController.argumentData['recipe']
                                            ['calories']
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: 'taj',
                                        fontSize: 15,
                                        color: _homecontroller.IsDark.value? Color.fromARGB(255, 225, 255, 252): Color.fromARGB(255, 22, 53, 50)),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "ingredients weight in gram",
                                    style: TextStyle(
                                        fontFamily: 'taj',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: _homecontroller.IsDark.value? Color.fromARGB(255, 102, 184, 175):Color.fromARGB(255, 45, 66, 64)),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, bottom: 2),
                                          child: Row(
                                            children: [
                                              Text(
                                                (index + 1).toString() + "-",
                                                style: TextStyle(
                                                    fontFamily: 'taj',
                                                    fontSize: 15,
                                                    color: _homecontroller.IsDark.value? Color.fromARGB(255, 225, 255, 252): Color.fromARGB(255, 22, 53, 50)),
                                              ),
                                              Container(
                                                  child: Text(
                                                _recipeController
                                                        .argumentData['recipe']
                                                            ['ingredients']
                                                            [index]['weight']
                                                        .toStringAsFixed(2) +
                                                    " gram",
                                                style: TextStyle(
                                                    fontFamily: 'taj',
                                                    fontSize: 15,
                                                    color: _homecontroller.IsDark.value? Color.fromARGB(255, 225, 255, 252): Color.fromARGB(255, 22, 53, 50)),
                                              )),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  itemCount: _recipeController
                                      .argumentData['recipe']['ingredients']
                                      .length,
                                ),
                              ],
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ))));
  }
}
