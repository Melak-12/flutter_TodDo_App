import 'package:flutter/material.dart';
import 'package:task/screens/home.dart';
// import 'package:task/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'My s',
      theme: ThemeData(
          // primaryColor: const Color.fromARGB(255, 8, 85, 68),
          ),
      home: const HomePage(),
    );
  }
}
