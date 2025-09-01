import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:solid_test_task/features/color_generator/domain/entities/art_element.dart';
import 'package:solid_test_task/features/color_generator/domain/entities/element_shape.dart';
import 'package:solid_test_task/features/color_generator/presentation/pages/color_page.dart';
import 'package:solid_test_task/features/color_generator/presentation/painters/art_painter.dart';

/// A widget that renders randomly positioned art elements.
///
/// Each element is represented by an [ArtElement] with a specific
/// randomly generated color and shape.
/// The widget updates dynamically when the list of [colors] changes, adding new
/// elements.
///
/// Used in conjunction with [ColorPage] and [ArtPainter].
class ArtWidget extends StatefulWidget {

  /// List of randomly generated colors of elements.
  final List<Color> colors;

  /// Size of element.
  final double size;

  /// Unique key of [ArtWidget].
  final GlobalKey? repaintKey;

  /// Creates an [ArtWidget] with the given [colors], optional [size],
  /// and [repaintKey].
  const ArtWidget({
    required this.colors, super.key,
    this.size = 300,
    this.repaintKey,
  });

  @override
  State<ArtWidget> createState() => _ArtWidgetState();
}

/// State class for [ArtWidget].
///
/// Manages generation of [ArtElement]s based on the provided colors and
/// triggers repainting when new elements are added.
class _ArtWidgetState extends State<ArtWidget> {
  final List<ArtElement> _elements = [];
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _generateElements();
  }

  void _generateElements() {
    _elements.clear();
    for (final color in widget.colors) {
      _elements.add(_createRandomElement(color));
    }
  }

  void _addNewElements() {
    final int currentCount = _elements.length;

    for (int i = currentCount; i < widget.colors.length; i++) {
      // setState(() {
        _elements.add(_createRandomElement(widget.colors[i]));
      // });
    }
  }

  ArtElement _createRandomElement(Color color) {
    final double size = 20 + _random.nextDouble() * 90;
    final double x = _random.nextDouble() * (widget.size - size);
    final double y = _random.nextDouble() * (widget.size - size);
    final shape =
    ElementShape.values[_random.nextInt(ElementShape.values.length)];

    return ArtElement(
      color: color,
      rect: Rect.fromLTWH(x, y, size, size),
      shape: shape,
    );
  }

  @override
  Widget build(BuildContext context) {

    final Widget grid = Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: ArtPainter(elements: _elements),
      ),
    );

    return RepaintBoundary(
      key: widget.repaintKey,
      child: grid,
    );
  }

  @override
  void didUpdateWidget(ArtWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.colors.length > _elements.length) {
      _addNewElements();
    }
  }
}
