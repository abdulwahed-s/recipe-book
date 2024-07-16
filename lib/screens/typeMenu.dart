// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors,file_names

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/categoriescontroller.dart';
import 'package:food_recipe/controllers/homecontroller.dart';
import 'package:get/get.dart';

class TpyeMenu extends StatelessWidget {
  const TpyeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    categoriesController _categoriesController = Get.find();
    Homecontroller _homecontroller = Get.find();
    ScrollController _scrollcontroller = ScrollController();
    _scrollcontroller.addListener(
      () {
        if (_scrollcontroller.position.pixels ==
            _scrollcontroller.position.maxScrollExtent) {
          try {
            _categoriesController.GetMoreByUri(
                _categoriesController.MyProducts['_links']['next']['href']);
          } catch (e) {
            Flushbar(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  backgroundColor:_homecontroller.IsDark.value
                    ? Colors.grey.shade800
                    : Color.fromARGB(255, 196, 211, 255), 
                    duration: Duration(seconds: 3),
                    messageText: Text(
                  "no more recipes",
                  style: TextStyle(
                    color: _homecontroller.IsDark.value
                        ? Color.fromARGB(255, 187, 191, 255)
                        : Color.fromARGB(255, 16, 15, 27),
                    fontWeight: FontWeight.bold,
                    fontFamily: "taj",
                  ),
                ),
            ).show(context);
          }
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _categoriesController.argumentData + " recipes",
          style: TextStyle(
              fontSize: 26,
              color: _homecontroller.IsDark.value
                  ? Color.fromARGB(255, 187, 191, 255)
                  : Color.fromARGB(255, 16, 15, 27),
              fontFamily: "taj"),
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(() => GridView.builder(
                        controller: _scrollcontroller,
                        itemCount:
                            _categoriesController.MyProducts['hits']?.length ??
                                6,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 500 / 800,
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                        itemBuilder: (context, index) {
                          return _categoriesController.loading.value
                              ? Container(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/recipe",
                                        arguments: _categoriesController
                                            .MyProducts['hits'][index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: 5,
                                      left: 5,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: MediaQuery.of(context).size.height /3.6513,
                                            width:  MediaQuery.of(context).size.width /2.1333,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                _categoriesController
                                                            .MyProducts['hits']
                                                        [index]['recipe'][
                                                    'images']['REGULAR']['url'],
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    "images/error.png",
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 150,
                                          child: Text(
                                            _categoriesController
                                                    .MyProducts['hits'][index]
                                                ['recipe']['label'],
                                            style: TextStyle(
                                                color:
                                                    _homecontroller.IsDark.value
                                                        ? Color.fromARGB(
                                                            255, 187, 191, 255)
                                                        : Color.fromARGB(
                                                            255, 16, 15, 27),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "taj"),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "calories : ${_categoriesController.MyProducts['hits'][index]['recipe']['calories'].toInt()}",
                                                style: TextStyle(
                                                    color: _homecontroller
                                                            .IsDark.value
                                                        ? Color.fromARGB(
                                                            255, 114, 158, 255)
                                                        : Color.fromARGB(
                                                            255, 35, 40, 83),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "taj"),
                                              ),
                                              Text(
                                                _categoriesController
                                                        .MyProducts['hits']
                                                            [index]['recipe']
                                                            ['dishType']?[0]
                                                        .toString() ??
                                                    "no dish type",
                                                style: TextStyle(
                                                    color: _homecontroller
                                                            .IsDark.value
                                                        ? Color.fromARGB(
                                                            255, 114, 158, 255)
                                                        : Color.fromARGB(
                                                            255, 35, 40, 83),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "taj",
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
