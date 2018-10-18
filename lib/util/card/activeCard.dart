import 'dart:math';
import 'package:dr_oz_tips/util/card/detailCard.dart';
import 'package:dr_oz_tips/widget/round_button.dart';
import 'package:flutter/material.dart';

Positioned cardDemo(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissImg,
    int flag,
    Function addImg,
    Function swipeRight,
    Function swipeLeft) {
  Size screenSize = MediaQuery.of(context).size;

  // print("Card");
  return new Positioned(
    bottom: 100.0 - bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {},
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart)
          dismissImg(img);
        else
          addImg(img);
      },
      child: new Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        transform: new Matrix4.skewX(skew),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: new Hero(
            tag: "img",
            child: new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(type: img),
                ));
              },
              child: new Card(
                color: Colors.transparent,
                elevation: 4.0,
                child: new Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2 + cardWidth,
                  height: screenSize.height / 1.7,
                  decoration: new BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.only(
                              topLeft: new Radius.circular(10.0),
                              topRight: new Radius.circular(10.0)),
                          image: img,
                        ),
                      ),
                      new Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: new Container(
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.8),
                                ]),
                          ),
                          padding: const EdgeInsets.all(24.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Expanded(
                                  child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'First Last',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  new Text(
                                    'Short Description',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  )
                                ],
                              )),
                              new RoundIconButton.large(
                                icon: Icons.favorite,
                                iconColor: Colors.white,
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text('Beğendiniz !'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        // Some code to undo the change!
                                      },
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
