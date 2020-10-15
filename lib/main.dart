import 'package:apod_flutter/network/get_data.dart';
import 'package:apod_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  final data = GetData();
  data.getImages();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color(0xff121212),
      ),
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
