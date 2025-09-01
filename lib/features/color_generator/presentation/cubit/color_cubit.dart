import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/core/services/art_share_manager.dart';
import 'package:solid_test_task/core/utils/color_changer.dart';

/// A [Cubit] responsible for managing and updating
/// the application's color state.
///
/// The [ColorCubit] initializes with a default color of [Colors.white]
/// and provides functionality to change the color
/// randomly and to share rendered art widgets.
class ColorCubit extends Cubit<Color> {

  /// Default color is [Colors.white].
  ColorCubit() : super(Colors.white);

  /// Generates a new random color using [ColorChanger.getRandomColorFromARGB]
  /// and emits it to the current state.
  void changeColor() {
    final newColor = ColorChanger.getRandomColorFromARGB();
    emit(newColor);
  }

  /// Captures and shares the widget identified by [artWidgetKey].
  ///
  /// - [artWidgetKey]: A [GlobalKey] referencing the widget to share.
  /// - [name]: The name of the file to be saved/shared.
  /// - [text]: Description or caption to accompany
  /// the shared content.
  void shareArt (GlobalKey artWidgetKey,
  String name, String text,) {
    ArtShareManager.shareWidget(
      repaintBoundaryKey: artWidgetKey,
      fileName: name,
      text: text,
    );
  }
}
