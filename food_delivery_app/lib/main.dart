import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFE7703F),
        ),
        primaryColor: Color(0xFFE7703F),
      ),
      home: HomeScreen(),
    );
  }
}
