import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  cardColor: Colors.white,
  dividerColor: Colors.grey[300],
  backgroundColor: Colors.grey[100],
  primaryColor: Colors.orange,
  primaryColorBrightness: Brightness.light,
  secondaryHeaderColor: Colors.white,
  accentColor: Colors.orangeAccent,
  primaryTextTheme: new Typography(platform: defaultTargetPlatform).white,
  primaryIconTheme: const IconThemeData(color: Colors.white),
  accentIconTheme: const IconThemeData(color: Colors.white)
);