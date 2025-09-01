/// Class with constants of the app.
class AppConstants {
  /// App bar name.
  static const appBarName = 'Getting random colors!';

  /// Text on button, which changes color.
  static const changeColorButtonText = 'CHANGE COLOR';

  /// Text on button, which shares generated art.
  static const shareButtonText = 'Share your art!';

  /// Art key, used in file name.
  static const String artKey = 'Give me an offer, please :D ';

  /// Default description of image for sharing.
  static const String defaultImageText = 'My art!';

  /// Exception finding context for BoundaryKey.
  static const String exceptionFindingContextForBoundaryKey =
      'Context not found for RepaintBoundary key';

  /// Exception finding RenderObject.
  static const String exceptionRenderObjectFound = 'RenderObject not found';

  /// Exception wrapping object into RepaintBoundary.
  static const String exceptionWrappingIntoRepaintBoundary =
      "Widget isn't wrapped with RepaintBoundary";

  /// Exception converting image to ByteData.
  static const String exceptionConvertingImage =
      'Failed to convert image to ByteData';

  /// Default generated color opacity.
  static const int defaultOpacity = 255;

  /// Default generated RGB color diapason.
  static const int colorDiapason = 256;

  /// Default main axis distance between elements.
  static const double mainAxisDistance = 20;

  /// Title for shared art, displayed after sending.
  static String artTitle(int colorsCount) => 'My art of $colorsCount colors!';
}
