// Packages
import 'package:flutter/material.dart';
import 'package:frontend/screens/ingredients/ingredient_screen.dart';
import 'package:frontend/screens/shopping_list/shopping_list_screen.dart';

// Files
import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../../constants/funcs.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: appBar(),
      bottomNavigationBar: bottomNavBar(
        currIndex: 2, 
         onItemTap: (index) {
          if(index == 0) {
            Navigator.pushReplacement(context, noTransitionRoute(IngredientScreen()));
          }
          if(index == 1) {
            Navigator.pushReplacement(context, noTransitionRoute(ShoppingListScreen()));
          }
        }  
      ),
    );
  }

  void _onItemTapped(int index) {
    if(index == 0) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => IngredientScreen()));
    }
    if(index == 1) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => ShoppingListScreen())
      );
    }
  }
}