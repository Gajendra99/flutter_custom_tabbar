import 'package:flutter/material.dart';
import 'package:flutter_custom_tabbar/tab_item.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabchanged;
  final List<TabItem> tabs;

  CustomTabBar(
      {required this.currentIndex,
      required this.onTabchanged,
      required this.tabs});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.transparent,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 350),
            left: currentIndex * Get.width / 3,
            child: Container(
              alignment: Alignment.center,
              width: Get.width / 3,
              height: 48,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tabs
                .asMap()
                .map((index, tab) {
                  return MapEntry(
                      index,
                      GestureDetector(
                          onTap: () => onTabchanged(index),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            width: (Get.width - 30) / 3,
                            child: Center(
                                child: Text(
                              tab.title,
                              style: TextStyle(
                                  color: index == currentIndex
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          )));
                })
                .values
                .toList(),
          )
        ],
      ),
    );
  }
}
