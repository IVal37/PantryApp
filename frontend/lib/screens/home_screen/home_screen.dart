// Packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// Files
import '../ingredients/ingredient_screen.dart';
import '../recipes/recipe_screen.dart';
import '../shopping_list/shopping_list_screen.dart';
import '../../constants/colors.dart';

// SFL for BottomNavBar Logic
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    IngredientScreen(),
    ShoppingListScreen(),
    RecipeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: Text(
          style: GoogleFonts.cormorant(
              fontSize: 36,
              color: bgWhite,
              letterSpacing: 4,
          ),
          "PANTRY"
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: bgBlack,
        selectedItemColor: colorList[_selectedIndex],
        unselectedItemColor: bgWhite,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.carrot),
            label: "INGREDIENTS",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.list),
            label: "SHOPPING LIST",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.book),
            label: "RECIPES",
          ),
        ],
      ),
    );
  }
}