import 'package:flutter/material.dart';

/// Provides the application's theme data.
///
/// Currently contains only a light theme. This class centralizes
/// all theme-related configurations, like colors and text styles.
class AppTheme {
  /// Returns the light theme of the application
  ///
  /// Uses Material 3 design and defines a color scheme based on a
  /// light blue seed color. Includes custom text styles for
  /// bodyLarge, bodyMedium, and labelLarge text.
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 28,
          letterSpacing: 5,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w300,
        ),
        bodyMedium: TextStyle(
          fontSize: 24,
          letterSpacing: 2,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
