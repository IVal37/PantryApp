// Packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/recipes/recipe_screen.dart';
import 'package:frontend/screens/shopping_list/shopping_list_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// Files
import '../../constants/colors.dart';
import '../../constants/strings.dart';

class IngredientScreen extends StatefulWidget {
  const IngredientScreen({super.key});

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: Text(
          appTitle,
          style: GoogleFonts.cormorant(
              fontSize: 36,
              color: bgWhite,
              letterSpacing: 4,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: _onItemTapped,
        backgroundColor: bgBlack,
        selectedItemColor: ingredientColor,
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

  void _onItemTapped(int index) {
    if(index == 0) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => ShoppingListScreen()));
    }
    if(index == 2) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => RecipeScreen())
      );
    }
  }
}