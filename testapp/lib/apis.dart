import 'package:flutter/material.dart';

import 'main.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(child: Text("API")),
      );
  }
}
