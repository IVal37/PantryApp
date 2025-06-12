// Packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/ingredients/ingredient_screen.dart';
import 'package:frontend/screens/recipes/recipe_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// Files
import 'util/list_widget.dart';
import 'util/list_info.dart';
import 'util/list_item.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // Lists
  List<ListInfo> listList = [
    ListInfo(
      name: "Safeway",
      items: 
        [
          ListItem(name: "russett potatoes"),
          ListItem(name: "detergent pods"),
          ListItem(name: "strawberries"),
          ListItem(name: "bread"),
          ListItem(name: "cucumber"),
          ListItem(name: "salt"),
          ListItem(name: "pepper"),
          ListItem(name: "real good chicken nuggets"),
        ],
    ),
    ListInfo(name: "Trader Joe's"),
    ListInfo(name: "Protein Brownies"),
    ListInfo(name: "Michelle's Birthday"),
    ListInfo(name: "Gucci"),
  ];

  List<ListInfo> archiveList = [];
  List<ListInfo> recentlyDeletedList = [];

  // PopUpMenuItem Funcs
  void AddList() {
    setState(() {
      listList.add(ListInfo(name: "New List"));
    });
  }

  void ArchiveList(ListInfo target) {
    setState(() {
      listList.remove(target);
      archiveList.add(target);
    });
  }

  void DeleteList(ListInfo target) {
    setState(() {
      recentlyDeletedList.add(target);
      listList.remove(target);
      archiveList.remove(target);
    });
  }

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
        currentIndex: 1,
        onTap: _onItemTapped,
        backgroundColor: bgBlack,
        selectedItemColor: shoppingListColor,
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
      drawer: Drawer(
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.line_axis,
        ),
      ),
      body: ListView.builder(
        itemCount: listList.length,
        itemBuilder: (context, index) {
          return ListWidget(
            listName: listList[index].name,
            listContent: listList[index].items,
            onFavorite: () {
              setState(() {
                listList[index].toggleFavorite();
              });
            },
            onArchive: () {
              setState(() {
                ArchiveList(listList[index]);
              });
            },
            onDelete: () {
              setState(() {
                DeleteList(listList[index]);
              });
            },
            onExpand: () {
              setState(() {
                for(int i = 0; i < listList.length; i++) {
                  if(i == index) {
                    listList[index].toggleDropdown();
                    continue;
                  }
                  listList[i].setDropdown(false);
                }
              });
            },
            // Getters
            getIsExpanded: () {
              return listList[index].isDropdown;
            },
            getIsFavorite: () {
              return listList[index].isFavorite;
            },
          );
        },
      ),
      floatingActionButton: Transform.rotate(
        angle: 0.785398,
        child: FloatingActionButton(
          onPressed: () => AddList(),
          backgroundColor: bgBlack,
          hoverColor: hoverGray,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Transform.rotate(
            angle: -0.785398,
            child: Icon(
              Icons.add,
              color: bgWhite,
            ),
          ),
        ),
      ),
    );
  }


  void _onItemTapped(int index) {
    if(index == 0) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => IngredientScreen()));
    }
    if(index == 2) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => RecipeScreen())
      );
    }
  }
}