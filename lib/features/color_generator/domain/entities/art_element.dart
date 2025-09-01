import 'package:flutter/material.dart';
import 'package:solid_test_task/features/color_generator/domain/entities/element_shape.dart';

/// Represents a single element of generated art.
///
/// Each [ArtElement] contains:
/// - a [color] used to fill the element,
/// - a [rect] that defines its position and size,
/// - a [shape] describing its geometric form.
class ArtElement {
  /// The fill color of the art element.
  final Color color;

  /// The rectangular area that defines the size and position of the element.
  final Rect rect;

  /// The shape of the element.
  final ElementShape shape;

  /// Creates an [ArtElement] with the given [color], [rect], and [shape].
  ArtElement({required this.color, required this.rect, required this.shape});
}
