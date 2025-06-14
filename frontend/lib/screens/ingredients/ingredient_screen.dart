// Packages
import 'package:flutter/material.dart';
import 'package:frontend/screens/recipes/recipe_screen.dart';
import 'package:frontend/screens/shopping_list/shopping_list_screen.dart';

// Files
import '../../constants/colors.dart';
import '../../constants/widgets.dart';

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
      appBar: appBar(),
      bottomNavigationBar: bottomNavBar(
        currIndex: 0, 
        onItemTap: (index) {
          if(index == 1) {
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