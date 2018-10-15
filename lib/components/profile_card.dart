import 'package:flutter/material.dart';
import './photo_browser.dart';
import '../components/round_button.dart';

class ProfileCard extends StatefulWidget {
  ProfileCardState createState() => ProfileCardState();
}

class ProfileCardState extends State<ProfileCard> {
  Widget _buildBackground() {
    return new PhotoBrowser(
      photoAssetPaths: [
        'assets/photo_1.jpg',
        'assets/photo_2.jpg',
        'assets/photo_3.jpeg'
      ],
      visiblePhotoIndex: 0,
    );
  }

  Widget _buildProfileSynopsis() {
    return new Positioned(
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
            ],
          ),
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
                    'Some Description',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            new RoundIconButton.large(
              icon: Icons.favorite,
              iconColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: [
          new BoxShadow(
            color: const Color(0x11000000),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(10.0),
        child: new Material(
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBackground(),
              _buildProfileSynopsis(),
            ],
          ),
        ),
      ),
    );
  }
}
