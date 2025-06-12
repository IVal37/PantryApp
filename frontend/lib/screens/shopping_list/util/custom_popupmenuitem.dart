// Packages
import 'package:flutter/material.dart';

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  final Color? color;

  const CustomPopupMenuItem({
    Key? key,
    T? value,
    bool enabled = true,
    Widget? child,
    this.color,
  }) : super(key: key, value: value, enabled: enabled, child: child);

  @override
  _CustomPopupMenuItemState<T> createState() => _CustomPopupMenuItemState<T>();
}

class _CustomPopupMenuItemState<T> extends PopupMenuItemState<T, CustomPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: super.build(context),
      color: widget.color,
    );
  }
}