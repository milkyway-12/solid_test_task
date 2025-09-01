import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:solid_test_task/core/constants/app_constants.dart';

/// Utility class for generating random colors - main class of this test task
class ColorChanger {

  /// Generates a random [Color] with full opacity.
  ///
  /// Only the red, green, and blue components are randomized.
  /// The alpha channel is fixed to `255` (fully opaque), because
  /// transparency would distort the appearance of art elements
  /// when rendered on a colored background.
  static Color getRandomColorFromARGB () {
    final random = Random();

    return Color.fromARGB(
      AppConstants.defaultOpacity,
      random.nextInt(AppConstants.colorDiapason),
      random.nextInt(AppConstants.colorDiapason),
      random.nextInt(AppConstants.colorDiapason),
    );
  }
}
