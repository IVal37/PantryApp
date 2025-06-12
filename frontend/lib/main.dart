// Packages
import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen/indexed_screens.dart';

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
        popupMenuTheme: PopupMenuThemeData(
          color: bgBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 10,
          
        ),
        primarySwatch: Colors.teal,
        useMaterial3: true,
        scaffoldBackgroundColor: bgBlack,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}