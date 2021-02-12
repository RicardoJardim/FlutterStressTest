import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(child: Text("SERVER DATA")),        
      );
  }
}
