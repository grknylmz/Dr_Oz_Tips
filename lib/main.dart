import 'package:flutter/material.dart';
import 'components/round_button.dart';
import 'components/photo_indicator.dart';
import './pages/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColorBrightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}

//----------- begin of HomePage StatefulWidget----------------------

//---------end of HomePage StatefulWidget-----------------------------------

//---------begin of ProfileCard StatefulWidget-----------------------------

//----------end of ProfileCard StatefulWidget------------------------------

//----------begin of Photo Browser StatefulWidget---------------------------

//-----------end of Photo Browser StatefulWidget-------------------------------
