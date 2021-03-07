import 'dart:ffi';

import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  GlobalButton({
    Key key,
    this.title,
    this.callback,
  }) : super(key: key);
  final String title;
  final Function callback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.height - 300,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              elevation: MaterialStateProperty.all<double>(2),
            ),
            onPressed: () {
              callback();
            },
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
