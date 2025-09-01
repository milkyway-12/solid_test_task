import 'package:flutter/material.dart';

/// An abstract repository that defines the contract
/// for sharing widgets as images.
abstract class ArtShareRepository {
  /// Shares a widget identified by [artWidgetKey] as an image file.
  Future<void> shareArt({
    required GlobalKey artWidgetKey,
    required String name,
    String? text,
  });
}
