import 'package:flutter/material.dart';
import 'package:flutter_custom_tabbar/custom_tab_bar.dart';
import 'package:flutter_custom_tabbar/tab_item.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomTab(),
    );
  }
}

class CustomTab extends StatefulWidget {
  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  int _currentIndex = 0;

  void _onTabchanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Color> txtColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Code By Chance',
          ),
          elevation: 2,
        ),
        body: Column(
          children: [
            CustomTabBar(
                currentIndex: _currentIndex,
                onTabchanged: _onTabchanged,
                tabs: [
                  TabItem(
                    title: 'Tab 1',
                  ),
                  TabItem(
                    title: 'Tab 2',
                  ),
                  TabItem(
                    title: 'Tab 3',
                  ),
                ]),
            Expanded(
                child: Center(
              child: Text(
                'Content for Tab ${_currentIndex + 1}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: txtColors[_currentIndex]),
              ),
            ))
          ],
        ));
  }
}
