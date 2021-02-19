import 'package:flutter/material.dart';
import 'utils.dart';

class API extends StatefulWidget {
  API({
    Key key,
  }) : super(key: key);

  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  @override
  void initState() {
    super.initState();
  }

  void createViews() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
