import 'package:flutter/cupertino.dart';

import 'package:solid_test_task/features/color_generator/domain/entities/art_element.dart';
import 'package:solid_test_task/features/color_generator/domain/entities/element_shape.dart';
import 'package:solid_test_task/features/color_generator/presentation/widgets/art_widget.dart';

/// A [CustomPainter] that draws a list of [ArtElement]s on a canvas.
///
/// Each [ArtElement] defines its own color, shape, and rectangular bounds.
/// Supported shapes are:
/// - [ElementShape.rectangle]
/// - [ElementShape.circle]
/// - [ElementShape.triangle]
///
/// This painter is typically used in conjunction with [ArtWidget] to render
/// generated art elements on the screen.
class ArtPainter extends CustomPainter {

  /// List of elements to paint.
  final List<ArtElement> elements;

  /// Creates an [ArtPainter] with the given [elements].
  ///
  /// All elements in the list will be rendered on the canvas when painted.
  ArtPainter({required this.elements});

  @override
  void paint(Canvas canvas, Size size) {
    for (final element in elements) {
      final paint = Paint()
        ..color = element.color
        ..style = PaintingStyle.fill;

      switch (element.shape) {

        case ElementShape.rectangle:
          canvas.drawRect(element.rect, paint);

        case ElementShape.circle:
          canvas.drawOval(element.rect, paint);

        case ElementShape.triangle:
          final path = Path();
          path.moveTo(element.rect.center.dx, element.rect.top);
          path.lineTo(element.rect.left, element.rect.bottom);
          path.lineTo(element.rect.right, element.rect.bottom);
          path.close();
          canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
