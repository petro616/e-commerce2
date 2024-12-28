import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontFamily: "PlayfairDisplay",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25),
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 223, 177, 104),
    ));
ThemeData themeArabic = ThemeData(fontFamily: "Cairo");
