import 'package:flutter/material.dart';
import 'package:memory_card_game/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Card Game',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Color(0xFF1A1A2E),
      ),
      home: MenuScreen(),
    );
  }
}

