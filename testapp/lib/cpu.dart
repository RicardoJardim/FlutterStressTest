import 'package:flutter/material.dart';

class CPU extends StatefulWidget {
  CPU({
    Key key,
  }) : super(key: key);

  _CPUState createState() => _CPUState();
}

class _CPUState extends State<CPU> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(child: Text("CPU")), 
      );
  }
}
