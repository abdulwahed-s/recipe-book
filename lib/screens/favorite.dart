// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/homecontroller.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Homecontroller _homecontroller = Get.find();
    return Scaffold(
    appBar: AppBar(title: Text(
          "Favourite",
          style: TextStyle(
            fontFamily: 'taj',
          ),
        ),),
        body: Obx(
      () => ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Obx(
              () =>  GestureDetector(
                onTap: () {
                  Get.toNamed("/recipe",
                      arguments: _homecontroller.MyFavorites[index]);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                      color:_homecontroller.IsDark.value? Colors.grey.shade900:Color.fromARGB(255, 230, 230, 230),
                      boxShadow: [
                        BoxShadow(
                          color:_homecontroller.IsDark.value? Color.fromARGB(255, 15, 15, 15):Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: 5,
                          left: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            _homecontroller.MyFavorites[index]['recipe']['images']
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 160,
                            child: Text(
                              _homecontroller.MyFavorites[index]['recipe']
                                  ['label'],
                              style: TextStyle(
                                  color:_homecontroller.IsDark.value? Color.fromARGB(255, 187, 191, 255): Color.fromARGB(255, 16, 15, 27),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "taj"),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "calories : ${_homecontroller.MyFavorites[index]['recipe']['calories'].toInt()}",
                            style: TextStyle(
                                color:_homecontroller.IsDark.value? Color.fromARGB(255, 114, 158, 255):Color.fromARGB(255, 35, 40, 83),
                                fontWeight: FontWeight.w600,
                                fontFamily: "taj"),
                          ),
                          Text(
                            _homecontroller.MyFavorites[index]['recipe']
                                    ['dishType'][0]
                                .toString(),
                            style: TextStyle(
                                color: _homecontroller.IsDark.value? Color.fromARGB(255, 114, 158, 255):Color.fromARGB(255, 35, 40, 83),
                                fontWeight: FontWeight.w600,
                                fontFamily: "taj",
                                fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _homecontroller.MyFavorites.length),
    ));
  }
}
