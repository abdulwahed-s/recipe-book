// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/homecontroller.dart';
import 'package:get/get.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomePage extends StatelessWidget {
  final Homecontroller _homecontroller = Get.find();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
          "Recipe book",
          style: TextStyle(
            fontFamily: 'taj',
          ),
        ),
        actions: [
          SearchBarAnimation(
          enteredTextStyle: TextStyle(
          color: !_homecontroller.IsDark.value? Colors.black:Colors.white,
          ),
          buttonColour:  _homecontroller.IsDark.value? Colors.black:Colors.white,
            onFieldSubmitted: (value) {
              Get.toNamed("/typeMenu", arguments: value);
            },
            onChanged: (value) {
              search = value;
            },
            searchBoxWidth: MediaQuery.of(context).size.width - 2,
            textEditingController: TextEditingController(),
            isOriginalAnimation: true,
            trailingWidget: GestureDetector(
              onTap: () {
                Get.toNamed("/typeMenu", arguments: search);
              },
              child: Icon(
                Icons.search,
                size: 20,
                color:!_homecontroller.IsDark.value? Colors.black:Colors.white,
              ),
            ),
            secondaryButtonWidget:  Icon(
              Icons.close,
              size: 20,
              color: !_homecontroller.IsDark.value? Colors.black:Colors.white,
            ),
            buttonWidget:  Icon(
              Icons.search,
              size: 20,
              color: !_homecontroller.IsDark.value? Colors.black:Colors.white,
            ),
            searchBoxColour:_homecontroller.IsDark.value? Colors.black:Colors.white, 
          )
        ],
      ),
      body: SafeArea(
          child: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () => _homecontroller.refresh(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 5),
                  child: Text(
                    "Recipes for you  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 370,
                    child: myListView()),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/AllCategories");
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            "show more",
                            style: TextStyle(
                              color: Colors.pink[200],
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(height: 300, child: myCategories())
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget myCategories() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed("/typeMenu",
                arguments: _homecontroller.categories[index]['name']);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black26, BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage(
                            _homecontroller.categories[index]['img']))),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  _homecontroller.categories[index]['name'],
                  style: TextStyle(
                      fontFamily: 'taj',
                      color:_homecontroller.IsDark.value? Colors.white: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        );
      },
      itemCount: 5
    );
  }

  Widget myListView() {
    return Obx(
      () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return !_homecontroller.Products['hits'].isNotEmpty
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        // color: Colors.black
                        ),
                    height: 250,
                    width: 200,
                    child: Center(
                      child: Text(
                        "cant find recipes please check your diet and health settings",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'taj',
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : _homecontroller.loding.value
                    ? Container(
                        height: 250,
                        width: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.toNamed("/recipe",
                              arguments: _homecontroller.Products['hits']
                                  [index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 5,
                                left: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 260,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  _homecontroller.Products['hits'][index]
                                      ['recipe']['images']['REGULAR']['url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                _homecontroller.Products['hits'][index]
                                    ['recipe']['label'],
                                style: TextStyle(
                                    color:_homecontroller.IsDark.value? Color.fromARGB(255, 187, 191, 255): Color.fromARGB(255, 16, 15, 27),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "taj"),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "calories : ${_homecontroller.Products['hits'][index]['recipe']['calories'].toInt()}",
                                  style: TextStyle(
                                      color: _homecontroller.IsDark.value? Color.fromARGB(255, 114, 158, 255):Color.fromARGB(255, 35, 40, 83),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "taj"),
                                ),
                                Text(
                                  _homecontroller.Products['hits'][index]
                                          ['recipe']['dishType'][0]
                                      .toString(),
                                  style: TextStyle(
                                      color: _homecontroller.IsDark.value? Color.fromARGB(255, 114, 158, 255): Color.fromARGB(255, 35, 40, 83),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "taj",
                                      fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      );
          },
          itemCount: _homecontroller.loding.value
              ? 5
              : _homecontroller.Products.length),
    );
  }
}
