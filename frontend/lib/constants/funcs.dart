// Packages
import 'package:flutter/material.dart';

Route noTransitionRoute(Widget page) => PageRouteBuilder(
  pageBuilder: (_, __, ___) => page,
  transitionDuration: Duration.zero,
  reverseTransitionDuration: Duration.zero,
);