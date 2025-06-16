// Packages
import 'package:flutter/material.dart';
import 'package:frontend/screens/ingredients/ingredient_screen.dart';
import 'package:frontend/screens/recipes/recipe_screen.dart';

// Files
import 'util/list_widget.dart';
import 'util/list_info.dart';
import 'util/list_item.dart';
import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../../constants/funcs.dart';

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
  // List functionality
  late List<List<dynamic>> currList = [listList, archiveList, recentlyDeletedList];
  late int currListIndex = 0;

    return Scaffold(
      backgroundColor: bgWhite,
      appBar: appBar(),
      bottomNavigationBar: bottomNavBar(
        currIndex: 1, 
        onItemTap: (index) {
          if(index == 0) {
            Navigator.pushReplacement(context, noTransitionRoute(IngredientScreen()));
          }
          if(index == 2) {
            Navigator.pushReplacement(context, noTransitionRoute(RecipeScreen()));
          }
        }  
      ),
      drawer: Drawer(
        backgroundColor: shoppingListColor,
        width: 250.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  "List Groups",
                  style: TextStyle(
                    color: bgBlack,
                    fontSize: 24.0,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 24.0,
                color: bgBlack,
                child: GestureDetector(
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: currList[currListIndex].length,
        itemBuilder: (context, index) {
          return ListWidget(
            listName: currList[currListIndex][index].name,
            listContent: currList[currListIndex][index].items,
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
                    currList[currListIndex][index].toggleDropdown();
                    continue;
                  }
                  currList[currListIndex][i].setDropdown(false);
                }
              });
            },
            // Getters
            getIsExpanded: () {
              return currList[currListIndex][index].isDropdown;
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
}