import 'package:flutter/material.dart';
import 'package:google_sheets_app/feedback_list.dart';

import 'controller/form_controller.dart';
import 'feedback_list.dart';
import 'form_view.dart';
import 'about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  //array of widget
  List _pages = [
    MyForm(),
    FeedbackListScreen(),
    AboutScreen(),
  ];

  //function onTab
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: _pages[_currentIndex]),
        //body end here

        //bottom navigation start here
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
                size: 25,
              ),
              label: "Maklum Balas",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 45,
              ),
              label: "Papar Maklum Balas",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: Colors.green,
                size: 25,
              ),
              label: "About",
            ),
          ],
        ),
        //bottom navigation end here
      ),
    );
  }
}
