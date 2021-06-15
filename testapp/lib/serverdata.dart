import 'package:flutter/material.dart';
import 'utils.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'dart:convert' as convert;
import 'dart:io';

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

  // ignore: non_constant_identifier_names
  void random_user() async {
    print("Random user start " + DateTime.now().toString());

    final response = await http.get(Uri.https(
        "random-data-api.com", "/api/users/random_user", {'size': '100'}));
    random_bank();
    if (response.statusCode == 200) {
      List<dynamic> list = convert.jsonDecode(response.body);
      writeCounter(list);
      print("Random user end " + DateTime.now().toString());
    } else {
      throw Exception('Failed to load album');
    }
  }

  void random_bank() async {
    print("Random bank start " + DateTime.now().toString());

    final response = await http.get(Uri.https(
        "random-data-api.com", "/api/bank/random_bank", {'size': '100'}));

    if (response.statusCode == 200) {
      List<dynamic> list = convert.jsonDecode(response.body);
      writeCounter2(list);
      print("Random bank end " + DateTime.now().toString());
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.txt');
  }

  Future<File> get _localFile2 async {
    final path = await _localPath;
    return File('$path/banks.txt');
  }

  Future<File> writeCounter(List<dynamic> content) async {
    final file = await _localFile;
    print("Random user write " + DateTime.now().toString());

    return file.writeAsString('$content');
  }

  Future<File> writeCounter2(List<dynamic> content) async {
    final file = await _localFile2;
    print("Random bank write " + DateTime.now().toString());

    return file.writeAsString('$content');
  }

  List<Widget> viewsWidgets = [];

  void createViews() {
    print(DateTime.now());

    for (int i = 0; i <= 1000; i++) {
      viewsWidgets.add(_view(Colors.green));
    }
    setState(() {});
    print(DateTime.now());
  }

  void createBTN() {
    print(DateTime.now());

    for (int i = 0; i <= 1000; i++) {
      viewsWidgets.add(_btn(Colors.blue));
    }
    setState(() {});
    print(DateTime.now());
  }

  void fetchData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
             width: MediaQuery.of(context).size.width,
             height: 200,
            child: Center(
              child: Stack(
                children: viewsWidgets.length == 0 ? [Text("")] : viewsWidgets,
              ),
            ),
          ),
          GlobalButton(
              title: "Views",
              callback: () {
                createViews();
              }),
          GlobalButton(
              title: "Buttons",
              callback: () {
                createBTN();
              }),
          GlobalButton(
              title: "HTTP Data",
              callback: () {
                random_user();
              })
        ],
      )),
    );
  }
}

Widget _view(Color color) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Container(
      width: 200.0,
      height: 200.0,
      child: Container(
        decoration: new BoxDecoration(color: color, shape: BoxShape.rectangle),
      ),
    ),
  );
}

Widget _btn(Color color) {
  return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
          width: 200.0,
          height: 200.0,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            color: Colors.blue,
            onPressed: () {},
            textColor: Colors.white,
            child: Text(
              "test",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )));
}
