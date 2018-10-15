import 'package:flutter/material.dart';
import '../components/round_button.dart';
import '../src/layout_overlays.dart';
import '../src/layout_core.dart';
import '../components/profile_card.dart';

bool isCard = true;

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _bottomNavBarIndex = 0;

  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new IconButton(
        icon: new Icon(Icons.exit_to_app, color: Colors.grey, size: 40.0),
        onPressed: () {},
      ),
      title: new Text('DR. OZ TIPS'),
      /*actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.chat_bubble, color: Colors.grey, size: 40.0),
          onPressed: () {},
        ),]*/
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Colors.red,
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RoundIconButton.large(
                icon: Icons.refresh,
                iconColor: Colors.orange,
                onPressed: () {},
              ),
              new RoundIconButton.large(
                icon: Icons.clear,
                iconColor: Colors.red,
                onPressed: () {},
              ),
              new RoundIconButton.large(
                icon: Icons.star,
                iconColor: Colors.blue,
                onPressed: () {},
              ),
              new RoundIconButton.large(
                icon: Icons.favorite,
                iconColor: Colors.red,
                onPressed: () {},
              ),
            ]),
      ),
    );
  }

  Widget _buildCardStack() {
    return new AnchoredOverlay(
      showOverlay: true,
      child: new Center(),
      overlayBuilder: (BuildContext context, Rect anchorBounds, Offset anchor) {
        return CenterAbout(
          position: anchor,
          child: new Container(
            width: anchorBounds.width,
            height: anchorBounds.height,
            padding: const EdgeInsets.all(16.0),
            child: new ProfileCard(),
          ),
        );
      },
    );
  }

  Widget _buildListStack() {
    int _act = 1;
    return new ListTile(
        leading: const Icon(Icons.flight_land),
        title: const Text('Trix\'s airplane'),
        subtitle:
            _act != 2 ? const Text('The airplane is only in Act II.') : null,
        enabled: _act == 2,
        onTap: () {/* react to the tile being tapped */});
  }

  Widget _buildNavigationBottomBar() {
    return BottomNavigationBar(
      currentIndex: _bottomNavBarIndex,
      onTap: (int index) {
        setState(() {
          _bottomNavBarIndex = index;
          if (index == 0) {
            isCard = true;
          } else {
            isCard = false;
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.credit_card),
          title: new Text('Cards'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.list),
          title: new Text('List'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: _buildAppBar(),
        body: isCard ? _buildCardStack() : _buildListStack(),
        bottomNavigationBar: _buildNavigationBottomBar());
  }
}
