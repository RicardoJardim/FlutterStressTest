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
          child: RaisedButton(
            elevation: 2,
            splashColor: Colors.blue[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            color: Colors.blue,
            onPressed: () {
              callback();
            },
            textColor: Colors.white,
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
