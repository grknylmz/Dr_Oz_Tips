
import 'package:dr_oz_tips/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      // showPerformanceOverlay: true,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: new PageMain(),
      home: new HomeScreen(),
      //home: BottomNavigationDemo(),
      // home:new exp(),
    );
  }
}
