// Packages
import 'package:flutter/material.dart';

class ListItem {
  static int _itemIDCounter = 0;

  late final int itemID;
  String name;

  bool isSelected;

  late final TextEditingController controller;
  late final FocusNode node;

  ListItem({
    required this.name,
    this.isSelected = false,
  })

  {
    itemID = _itemIDCounter++;
    controller = TextEditingController(text: name);
    node = FocusNode();
  }
/*
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'isSelected': isSelected ? 1 : 0,
    'isFavorite': isFavorite ? 1 : 0,
  };
*/
  // Util
  void toggleSelected() {
    isSelected = !isSelected;
    //toMap()
  }
}