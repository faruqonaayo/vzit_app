import 'package:flutter/material.dart';
import 'package:vzit_app/vzit_app.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(55, 183, 195, 100),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kColorScheme.onPrimary,
            letterSpacing: 2,
          ),
        ),
        cardTheme: CardTheme().copyWith(
          color: Color.fromRGBO(235, 244, 246, 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
      ),
      home: VzitApp(),
    ),
  );
}
