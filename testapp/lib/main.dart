import 'package:flutter/material.dart';
import 'package:testapp/cpu.dart';
import 'cpu.dart';
import "serverdata.dart";
import 'apis.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> main_key = GlobalKey();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterStressTest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[CPU(), Server(), API()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          __buildItem('btn1', "creativity1"),
          __buildItem('btn2', "modeling1"),
          __buildItem('btn3', "tablet1"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        selectedIconTheme: IconThemeData(size: 30),
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  BottomNavigationBarItem __buildItem(String title, String icons) {
    print('assets/' + icons + '.png');
    return BottomNavigationBarItem(
        label: title,
        icon: ImageIcon(
          AssetImage('assets/' + icons + '.png'),
        ));
  }
}
