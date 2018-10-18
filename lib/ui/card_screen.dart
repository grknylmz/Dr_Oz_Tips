import 'dart:async';
import 'package:dr_oz_tips/model/data.dart';
import 'package:dr_oz_tips/util/card/activeCard.dart';
import 'package:dr_oz_tips/util/card/swipeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math';

class CardScreen extends StatefulWidget {
  @override
  CardScreenState createState() => new CardScreenState();
}

class CardScreenState extends State<CardScreen> with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  List data = imageData;
  List selectedData = [];

  void initState() {
    super.initState();

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = data.removeLast();
          data.insert(0, i);
          _buttonController.reset();
        }
      });
    });
    right = Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissImg(DecorationImage img) {
    setState(() {
      data.remove(img);
    });
  }

  addImg(DecorationImage img) {
    setState(() {
      data.remove(img);
      selectedData.add(img);
    });
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
    _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    _swipeAnimation();
  }

  //----Build App Bar-----
  Widget _buildAppBar() {
    var dataLength = data.length;
    return new AppBar(
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(102, 181, 138, 1.0),
      centerTitle: true,
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "DR. OZ TIPS",
            style: new TextStyle(
              fontSize: 15.0,
              letterSpacing: 3.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //----Build Body -----
  Widget _buildCardStack() {
    timeDilation = 0.4;
    double initialBottom = 15.0;
    var dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10.0;
    double backCardWidth = -30.0;

    return new Container(
      color: Color.fromRGBO(234, 245, 240, 1.0),
      alignment: Alignment.center,
      child: dataLength > 0
          ? new Stack(
              alignment: AlignmentDirectional.center,
              children: data.map((item) {
                if (data.indexOf(item) == dataLength - 1) {
                  return cardDemo(
                      item,
                      bottom.value,
                      right.value,
                      0.0,
                      backCardWidth + 10,
                      rotate.value,
                      rotate.value < -10 ? 0.1 : 0.0,
                      context,
                      dismissImg,
                      flag,
                      addImg,
                      swipeRight,
                      swipeLeft);
                } else {
                  backCardPosition = backCardPosition - 10;
                  backCardWidth = backCardWidth + 10;

                  return cardDemoDummy(item, backCardPosition, 0.0, 0.0,
                      backCardWidth, 0.0, 0.0, context);
                }
              }).toList())
          : new Text("Kart Kalmadı",
              style: new TextStyle(color: Colors.black, fontSize: 30.0)),
    );
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return (new Scaffold(
      appBar: _buildAppBar(),
      body: _buildCardStack(),
    ));
  }
}
