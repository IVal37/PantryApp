// Packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// Files
import 'colors.dart';
import 'strings.dart';

AppBar appBar() {
  return AppBar(
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
  );
}
BottomNavigationBar bottomNavBar({
  required int currIndex,
  required Function(int) onItemTap,
}) {
  return BottomNavigationBar(
    currentIndex: currIndex,
    onTap: onItemTap,
    backgroundColor: bgBlack,
    selectedItemColor: colorList[currIndex],
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
  );
}