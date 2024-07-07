import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor:  Colors.lightBlue,
  fontFamily: 'Michelle',
  textTheme: const TextTheme(
    
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 4, 3, 10), // Adjust text color for dark theme
      fontFamily: 'Michelle',
      fontWeight: FontWeight.w600,
    ),
    // Add more text styles as needed
  ),
);

// dark theme data


final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color.fromARGB(255, 10, 11, 12),
  fontFamily: 'Michelle',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white, // Adjust text color for dark theme
      fontFamily: 'Michelle',
      fontWeight: FontWeight.w600,
    ),
    // Add more text styles as needed
  ),
);