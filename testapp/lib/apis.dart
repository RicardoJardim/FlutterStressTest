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
              title: "GetCamera",
              callback: () {
                createViews();
              }),
          GlobalButton(
              title: "GetGallery",
              callback: () {
                createViews();
              }),
          GlobalButton(
              title: "GetGPS",
              callback: () {
                createViews();
              }),
          GlobalButton(
              title: "GetCalendar",
              callback: () {
                createViews();
              }),
          GlobalButton(
              title: "GetContacts",
              callback: () {
                createViews();
              })
        ],
      )),
    );
  }
}
