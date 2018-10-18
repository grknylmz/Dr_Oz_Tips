import 'dart:async';
import 'dart:convert';
import 'package:dr_oz_tips/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ListScreen extends StatefulWidget {
  @override
  ListScreenState createState() => new ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  //get data as json
  Map data;
  List userData;
  Future getData() async {
    var response = await http.get(
        Uri.encodeFull("https://reqres.in/api/users?page=2"),
        headers: {"Accept": "application/json"});
    data = json.decode(response.body);

    setState(() {
      userData = data["data"];
    });
    debugPrint(userData.toString());
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
  //get data as json

  //----Build App Bar-----
  Widget _buildAppBar() {
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

//Text(data[index]["title"]),
  Widget _buildListView() {
    return new ListView.builder(
      itemCount: userData == null ? 0 : userData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: new ListTile(
            leading: new Image(
              image: new AssetImage("assets/photo3.png"),
              height: 50.0,
              width: 50.0,
            ),
            title: new Column(
              children: <Widget>[
                new Text("This is the title"),
              ],
            ),
            trailing: new Column(
              children: <Widget>[
                new RawMaterialButton(
                  onPressed: () {},
                  child: new Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 18.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
    );
  }
}
