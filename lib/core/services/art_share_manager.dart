import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:solid_test_task/core/constants/app_constants.dart';

/// This class manages sharing of created abstract art picture.
/// Provides functionality to capture a widget as an image
/// and share it using system share dialog.
class ArtShareManager {
  /// Captures a widget as an image and shares it.
  ///
  /// The widget must be wrapped with a [RepaintBoundary] and
  /// identified with [repaintBoundaryKey].
  static Future<void> shareWidget({
    required GlobalKey repaintBoundaryKey,
    required String fileName,
    String? text,
  }) async {
    try {
      final BuildContext? context = repaintBoundaryKey.currentContext;
      if (context == null) {
        throw Exception(AppConstants.exceptionFindingContextForBoundaryKey);
      }

      final RenderObject? renderObject = context.findRenderObject();
      if (renderObject == null) {
        throw Exception(AppConstants.exceptionRenderObjectFound);
      }

      if (renderObject is! RenderRepaintBoundary) {
        throw Exception(AppConstants.exceptionWrappingIntoRepaintBoundary);
      }

      final ui.Image image = await renderObject.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw Exception(AppConstants.exceptionConvertingImage);
      }

      final Uint8List imageBytes = byteData.buffer.asUint8List();

      final Directory tempDir = await getTemporaryDirectory();
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final File imageFile = File('${tempDir.path}/${fileName}_$timestamp.png');

      await imageFile.writeAsBytes(imageBytes);

      await Share.shareXFiles(
        [XFile(imageFile.path)],
        text: text ?? AppConstants.defaultImageText,
      );
    } catch (e) {
      rethrow;
    }
  }
}
