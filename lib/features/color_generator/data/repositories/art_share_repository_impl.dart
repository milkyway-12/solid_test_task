import 'package:flutter/material.dart';
import 'package:solid_test_task/core/services/art_share_manager.dart';
import 'package:solid_test_task/features/color_generator/domain/repositories/art_share_repository.dart';

/// Concrete implementation of [ArtShareRepository] that uses [ArtShareManager]
/// to share widgets as images.
///
/// This class bridges the domain-level repository interface with the
/// actual platform-specific logic provided by [ArtShareManager].
class ArtShareRepositoryImpl implements ArtShareRepository {
  /// Shares a widget as an image using [ArtShareManager].
  ///
  /// [artWidgetKey] identifies the widget to capture.
  /// [name] is used for the file name of the saved image.
  /// [text] is an optional message to attach when sharing.
  @override
  Future<void> shareArt({
    required GlobalKey artWidgetKey,
    required String name,
    String? text,
  }) {
    return ArtShareManager.shareWidget(
      repaintBoundaryKey: artWidgetKey,
      fileName: name,
      text: text,
    );
  }
}
