import 'package:flutter/material.dart';
import 'utils.dart';
import 'main.dart';

class Server extends StatefulWidget {
  Server({
    Key key,
  }) : super(key: key);

  _ServerState createState() => _ServerState();
}

class _ServerState extends State<Server> {
  @override
  void initState() {
    super.initState();
  }

  void createViews() {
    print("createViews");
  }

  void fetchData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalButton(
              title: "Views",
              callback: () {
                createViews();
              }),
          GlobalButton(
              title: "Buttons",
              callback: () {
                createViews();
              }),
          GlobalButton(
              title: "HTTP Data",
              callback: () {
                createViews();
              })
        ],
      )),
    );
  }
}
