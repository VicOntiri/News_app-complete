import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFE7703F),
        ),
        primaryColor: const Color(0xFFE7703F),
      ),
      home: const HomeScreen(),
    );
  }
}
