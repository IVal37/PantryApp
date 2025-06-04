// Packages
import 'package:flutter/material.dart';

// Files
import 'screens/home_screen/home_screen.dart';
import 'constants/colors.dart';

void main() {
  runApp(PantryApp());
}

class PantryApp extends StatelessWidget {
  const PantryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        scaffoldBackgroundColor: bgBlack,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}