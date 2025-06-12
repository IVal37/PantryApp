// Packages
import 'package:flutter/material.dart';
import 'package:frontend/screens/ingredients/ingredient_screen.dart';
import 'package:frontend/screens/recipes/recipe_screen.dart';
import 'package:frontend/screens/shopping_list/shopping_list_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// Files
import '../../constants/colors.dart';
import '../../constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                appTitle,
                style: GoogleFonts.cormorant(
                  fontSize: 48,
                  color: bgWhite,
                  letterSpacing: 4,
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              ElevatedButton(
                onPressed: () {
                  ChooseScreen(context, 0);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(ingredientColor),
                ),
                child: Text(
                  "   Ingredients   ",
                  style: TextStyle(
                    color: bgBlack,
                  ),
                )
              ),
              SizedBox(height: 10.0,),
              ElevatedButton(
                onPressed: () {
                  ChooseScreen(context, 1);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(shoppingListColor),
                ),
                child: Text(
                  "Shopping Lists",
                  style: TextStyle(
                    color: bgBlack,
                  ),
                )
              ),
              SizedBox(height: 10.0,),
              ElevatedButton(
                onPressed: () {
                  ChooseScreen(context, 2);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(recipeColor),
                ),
                child: Text(
                  "      Recipes      ",
                  style: TextStyle(
                    color: bgBlack,
                  )
                )
              ),
              SizedBox(
                height: 180.0,
              )
            ],
          ),
        ],
      ),
    );
  }
  
  final List<Widget> _screens = const [
    IngredientScreen(),
    ShoppingListScreen(),
    RecipeScreen(),
  ];

  void ChooseScreen(context, int i) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => _screens[i],
      ),
    );
  }
}