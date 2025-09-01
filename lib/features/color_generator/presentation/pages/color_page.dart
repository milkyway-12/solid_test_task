import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/core/constants/app_constants.dart';
import 'package:solid_test_task/features/color_generator/presentation/cubit/color_cubit.dart';
import 'package:solid_test_task/features/color_generator/presentation/widgets/art_widget.dart';
import 'package:solid_test_task/features/color_generator/presentation/widgets/theme_button.dart';

/// Main screen of this project, that represents the button for changing color
/// of screen background and also - widget, that gets this color and adds a
/// random element of this random color onto [ArtWidget].
/// The last could be exported via button "Share art".
class ColorPage extends StatefulWidget {
  /// State for [ColorPage].
  ///
  /// Manages background color changes, adding new colors to the
  /// [ArtWidget], and sharing generated artwork via [ColorCubit].
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  /// List of generated colors used in [ArtWidget].
  List<Color> colors = [];

  /// Key used to capture [ArtWidget] as an image.
  final GlobalKey _artRepaintKey = GlobalKey();

  /// Triggers [ColorCubit] to generate and emit a new random color.
  void _changeColor() {
    context.read<ColorCubit>().changeColor();
  }

  /// Adds a newly generated [Color] to the list
  /// of correspondingly colors and displayed elements.
  void _addColorToColorsList(Color newColor) {
    setState(() {
      colors.add(newColor);
    });
  }

  /// Requests [ColorCubit] to capture and share the current artwork.
  void _shareArt(GlobalKey key, String name, String text) {
    context.read<ColorCubit>().shareArt(key, name, text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, Color>(
      listener: (_, newColor) {
        _addColorToColorsList(newColor);
      },
      child: BlocBuilder<ColorCubit, Color>(
        builder: (context, backgroundColor) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                title: Text(
                  AppConstants.appBarName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ThemeButton(
                      text: AppConstants.changeColorButtonText,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      onPressed: _changeColor,
                    ),
                    const SizedBox(height: AppConstants.mainAxisDistance),
                    ArtWidget(colors: colors, key: _artRepaintKey),
                    const SizedBox(height: AppConstants.mainAxisDistance),
                    ThemeButton(
                      text: AppConstants.shareButtonText,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      onPressed: () {
                        _shareArt(
                          _artRepaintKey,
                          AppConstants.artKey,
                          AppConstants.artTitle(colors.length),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
