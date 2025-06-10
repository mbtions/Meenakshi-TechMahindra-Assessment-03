import 'package:flutter/material.dart';

final ThemeData myAppTheme = ThemeData().copyWith(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFB76D68),
  scaffoldBackgroundColor: const Color(0xFF121420),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFB76D68),
    centerTitle: true,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFFB76D68),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
  ),
  iconTheme: const IconThemeData(color: Colors.white, size: 24),
  cardTheme: CardThemeData(
    color: Color(0xFF403F4C),
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
  ),
  // navigationBarTheme: const NavigationBarThemeData(
  //   backgroundColor: Color(0xFF121420),
  //   indicatorColor: Color(0xFFB76D68),
  //   labelTextStyle: MaterialStatePropertyAll(
  //     TextStyle(color: Colors.white, fontSize: 14),
  //   ),
  // ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121420),
    selectedItemColor: Color(0xFFB76D68),
    unselectedItemColor: Colors.white70,
    selectedLabelStyle: TextStyle(fontSize: 14),
    unselectedLabelStyle: TextStyle(fontSize: 12),
  ),
);
