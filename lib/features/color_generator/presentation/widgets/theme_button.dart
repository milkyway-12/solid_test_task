import 'package:flutter/material.dart';

/// A customizable themed button that follows the app's color scheme.
///
/// This widget wraps an [OutlinedButton] and applies the app's primary colors,
/// shadow, and text styling. It can be used wherever a consistent button
/// design is needed throughout the app.
class ThemeButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// Optional style for the button text.
  final TextStyle? textStyle;

  /// Callback executed when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a [ThemeButton] with the given [text], [onPressed] callback,
  /// and optional [textStyle].
  const ThemeButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColorLight,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          side: BorderSide(color: Theme.of(context).canvasColor),
          shadowColor: Theme.of(context).shadowColor),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ??
            Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
      ),
    );
  }
}
