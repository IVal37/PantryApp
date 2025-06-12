// Packages
import 'package:flutter/material.dart';

// Files
import 'list_item.dart';

class ListInfo {
  static int _listIDCounter = 0;

  late final int listID;
  String name;
  List<ListItem> items;

  bool isDropdown;
  bool isFavorite;

  ListInfo({    
    required this.name,
    this.items = const [],
    this.isDropdown = false,
    this.isFavorite = false,
  })

  {
    listID = _listIDCounter++;
  }
  /*
    Map<String, dynamic> toMap() => {
      'listID': listID,
      'name': name,
      'isDropdown': isDropdown ? 1 : 0,
      'isFavorite': isFavorite ? 1 : 0,
      'items': items.map((item) => item.toMap()).toList(),
    };
  */
  // Util
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  void toggleDropdown() {
    isDropdown = !isDropdown;
  }

  // Setters
  void setDropdown(bool status) {
    isDropdown = status;
  }

}