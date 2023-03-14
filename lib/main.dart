import './screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        tabBarTheme: const TabBarTheme(
            indicatorColor: Colors.red, labelColor: Colors.green),
      ),
      home: const HomeScreen(),
    );
  }
}
