// Packages
import 'package:flutter/material.dart';

// Files
import '../../../constants/colors.dart';
import 'custom_popupmenuitem.dart';
import 'list_info.dart';
import 'list_item.dart';

class ListWidget extends StatefulWidget {
  // List name and items in list
  final String listName;
  final List<ListItem> listContent;

  // PopupMenuButton methods
  final Function onFavorite;
  final Function onArchive;
  final Function onDelete;
  
  // Util
  final Function onExpand;

  // Getters
  final Function getIsExpanded;
  final Function getIsFavorite;

  const ListWidget({
    super.key,
    required this.listName,
    required this.listContent,

    required this.onFavorite,
    required this.onArchive,
    required this.onDelete,
    required this.onExpand,

    required this.getIsFavorite,
    required this.getIsExpanded,

  });

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  // List vars
  late bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Column(
        children: [
          _listHeader(),
          if (widget.getIsExpanded())
          _listContent(),
        ],
      ),
    );
  }

  Container _listContent() {
    return Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: shoppingListColor,
            border: BoxBorder.all(
              color: bgBlack,
              width: 4.0,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: ListView.builder(
              itemCount: widget.listContent.length,
              itemBuilder: (context, index) {
                return _itemRow(index);
              },
            ),
          ),
        );
  }

  Row _itemRow(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.listContent[index].toggleSelected();
            });
          },
          child: Icon(
            (widget.listContent[index].isSelected) ? Icons.circle : Icons.circle_outlined,
            size: 20.0,
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: TextField(
            controller: widget.listContent[index].controller,
            focusNode: widget.listContent[index].node,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            onSubmitted: (text) {
              setState(() {
                ListItem newItem = ListItem(name: "");
                widget.listContent.insert(index + 1, ListItem(name: ""));
                Future.delayed(Duration.zero, () {
                  newItem.node.requestFocus();
                });
              });
            },
            style: TextStyle(
              color: bgBlack,
              fontSize: 16,
              decoration: (widget.listContent[index].isSelected) ?
                          TextDecoration.lineThrough :
                          TextDecoration.none,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.only(
                top: 2.0,
                bottom: 2.0
              ),
              counterText: "",
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector _listHeader() {
    return GestureDetector(
          onTap: () {
            widget.onExpand();
          },
          child: Container(
            width: double.infinity,
            height: 32.0,
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
              color: bgBlack,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
                bottom: widget.getIsExpanded() ? Radius.zero : Radius.circular(8.0),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.listName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: bgWhite,
                        fontFamily: 'Times New Roman',
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    if(widget.getIsFavorite())
                    Icon(
                      Icons.favorite,
                      color: favPink,
                    ),
                  ],
                ),
                _optionsPopup(),
              ],
            ),
          ),
        );
  }

  PopupMenuButton<String> _optionsPopup() {
    return PopupMenuButton(
                  constraints: BoxConstraints(
                    minWidth: 80.0,
                    maxWidth: 100.0,
                    minHeight: 150.0,
                    maxHeight: 150.0,
                  ),
                  onSelected: (String item) => {
                    if(item == "Favorite") {
                      widget.onFavorite(),
                    },
                    if(item == "Archive") {
                      widget.onArchive(),
                    },
                    if(item == "Delete") {
                      widget.onDelete(),
                    }
                  },
                  itemBuilder: (context) => [
                    CustomPopupMenuItem(
                      color: favPink,
                      value: "Favorite",
                      child: Text(
                        (widget.getIsFavorite()) ? "Unfavorite" : "Favorite",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                        ),
                    ),
                    CustomPopupMenuItem(
                      color: archiveBlue,
                      value: "Archive",
                      child: Text(
                        "Archive",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                        ),
                    ),
                    CustomPopupMenuItem(
                      color: deleteRed,
                      value: "Delete",
                      child: Text(
                        "Delete",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                        ),
                    ),
                  ],
                  child: Icon(
                    Icons.more_horiz,
                    color: bgWhite,
                  ),
                );
  }
  
}
