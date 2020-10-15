import 'package:apod_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionColor: Color(0xffC7D5E0),
        highlightColor: Color(0xff66C0F4),
        accentColor: Color(0xff1B2838),
        backgroundColor: Color(0xff171A21),
        iconTheme: IconThemeData(
          color: Color(0xffC7D5E0),
        ),
      ),
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
