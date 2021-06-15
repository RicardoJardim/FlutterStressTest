import 'package:flutter/material.dart';
import 'utils.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class API extends StatefulWidget {
  API({
    Key key,
  }) : super(key: key);

  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  File _image;
  final picker = ImagePicker();
  final CalendarPlugin _myPlugin = CalendarPlugin();

  @override
  void initState() {
    super.initState();
  }

  Future<void> openCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void getGPS() async {
    Position values = await _determinePosition();
    print(values);
  }

  void getCalendar() {
    _myPlugin.hasPermissions().then((value) {
      if (!value) {
        _myPlugin.requestPermissions();
      } else {
        _myPlugin.getCalendars().then((value) {
          print(value);
        });
      }
    });
  }

  void getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts();
      print(contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        GlobalButton(
            title: "Camera",
            callback: () {
              openCamera();
            }),
        GlobalButton(
            title: "Gallery",
            callback: () {
              getImage();
            }),
        GlobalButton(
            title: "GPS",
            callback: () {
              getGPS();
            }),
        GlobalButton(
            title: "Calendar",
            callback: () {
              getCalendar();
            }),
        GlobalButton(
            title: "Contacts",
            callback: () {
              getContacts();
            })
          ],
        ),
      ),
    );
  }
}
