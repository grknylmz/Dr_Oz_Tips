import 'package:dr_oz_tips/ui/card_screen.dart';
import 'package:dr_oz_tips/ui/list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: "Using Tabs", home: new HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[new CardScreen(), new ListScreen()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          indicatorColor: Colors.redAccent,
          tabs: <Tab>[
            new Tab(
              icon: new Icon(
                Icons.credit_card,
                color: Colors.redAccent,
              ),
              text: 'Cards'
            ),
            new Tab(
              icon: new Icon(
                Icons.list,
                color: Colors.redAccent,
              ),
              text: 'List',
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
