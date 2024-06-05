import 'package:flutter/material.dart';

// final ColorScheme _appColorScheme = ColorScheme(
//   primary: Colors.blue,
//   primaryContainer: Colors.green,
//   secondary: Colors.amber,
//   secondaryContainer: Colors.grey,
//   surface: Colors.purpleAccent,
//   background: Colors.white10,
//   error: Colors.redAccent,
//   onPrimary: Colors.white,
//   onSecondary: Colors.deepOrange,
//   onSurface: Colors.purpleAccent,
//   onBackground: Colors.purpleAccent,
//   onError: Colors.redAccent,
//   brightness: Brightness.light,
// );

final ColorScheme _appColorScheme = ColorScheme(
  primary: Colors.blue, // Primary color
  primaryContainer: Colors.blue[700]!, // Darker shade of primary color
  secondary: Colors.blueAccent, // Accent color
  secondaryContainer:
      Colors.lightBlueAccent, // Lighter shade of secondary color
  surface: Colors.white, // Surface color for cards, sheets, etc.
  background: Colors.white, // Background color
  error: Colors.redAccent, // Error color
  onPrimary: Colors.white, // Color for text/iconography on primary color
  onSecondary: Colors.white, // Color for text/iconography on secondary color
  onSurface: Colors.black, // Color for text/iconography on surface color
  onBackground: Colors.black, // Color for text/iconography on background color
  onError: Colors.white, // Color for text/iconography on error color
  brightness: Brightness.light, // Brightness for light theme
);

final TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16.0),
    bodySmall: TextStyle(fontSize: 14.0));

final ButtonThemeData _buttonTheme = ButtonThemeData(
  textTheme: ButtonTextTheme.primary,
  buttonColor: _appColorScheme.primary,
  // minWidth: 88.0,
  // height: 36.0,
);

final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.green),
  ),
  labelStyle: TextStyle(color: Colors.grey),
  hintStyle: TextStyle(color: Colors.grey),
);

final ThemeData nebulaTheme = ThemeData(
    primaryColor: Colors.blue,
    colorScheme: _appColorScheme,
    textTheme: _textTheme,
    buttonTheme: _buttonTheme,
    inputDecorationTheme: _inputDecorationTheme);
