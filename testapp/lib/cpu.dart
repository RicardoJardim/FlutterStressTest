import 'package:flutter/material.dart';
import 'dart:math';
import 'utils.dart';

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

  void executeCPU() {
    print(DateTime.now());
    double result = 0;

    for (double j = 1; j <= 5; j++) {
      for (double k = 1; k <= 100000; k++) {
        result += log(k) + ((3 * k) / (2 * j)) + sqrt(k) + pow(k, j - 1);
      }
    }
    print(result);
    setState(() {
      value = result;
    });
    print(DateTime.now());
  }

  String title = "Result:";
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title + " " + value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          GlobalButton(
              title: "START",
              callback: () {
                executeCPU();
              })
        ],
      )),
    );
  }
}
