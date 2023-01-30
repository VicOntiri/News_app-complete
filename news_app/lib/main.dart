import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

String apiKey = '66f21f3b8f58423aa0b7aa3eb4e174c9';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
