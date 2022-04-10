import 'package:flutter/material.dart';
import 'package:statemanagement/home.dart';
import 'package:statemanagement/screensplash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'statemanagement',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenSplash(),
    );
  }
}
