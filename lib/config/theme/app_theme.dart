import 'package:flutter/material.dart';

const colorList = <Color>[
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.deepPurple,
  ];

class AppTheme {

  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
      this.selectedColor = 0,
      this.isDarkmode = false
    }) : assert( selectedColor >= 0, 'Selected color must be greater then 0' ),
         assert( selectedColor < colorList.length, 
         'Selected color must be less or equal than ${ colorList.length - 1 }' );

    ThemeData getTheme() {

      final selectedBrightness = isDarkmode ? Brightness.dark : Brightness.light;

      final colorScheme = ColorScheme.fromSeed(seedColor: colorList[selectedColor], brightness: selectedBrightness);

      return ThemeData(
        brightness: selectedBrightness,
        colorScheme: colorScheme,
        listTileTheme: ListTileThemeData(
          iconColor: colorScheme.primary
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false
        )
      );
    }

    AppTheme copyWith({
      int? selectedColor,
      bool? isDarkmode
    }) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkmode: isDarkmode ?? this.isDarkmode,
    );
}