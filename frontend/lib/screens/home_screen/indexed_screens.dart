// Packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// Files
import '../ingredients/ingredient_screen.dart';
import '../recipes/recipe_screen.dart';
import '../shopping_list/shopping_list_screen.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';

// SFL for BottomNavBar Logic
class IndexedScreens extends StatefulWidget {
  final int initialIndex;

  const IndexedScreens({super.key, this.initialIndex = 0});

  @override
  State<IndexedScreens> createState() => _IndexedScreensState();
}

class _IndexedScreensState extends State<IndexedScreens> {
  late int _selectedIndex;
  
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

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