/// class with constants of the app (strings)
class AppConstants {

  /// App bar name
  static const appBarName = 'Getting random colors!';

  /// Text on button, which changes color
  static const changeColorButtonText = 'CHANGE COLOR';

  /// Text on button, which shares generated art
  static const shareButtonText = 'Share your art!';

  /// Text for "reset" button
  static const resetButtonText = 'Reset';

  /// Art key, used in file name
  static String artKey(int colorsCount) => 'Give me an offer, please :D ';

  /// Title for shared art, displayed after sending
  static String artTitle(int colorsCount) => 'My art of $colorsCount colors!';
}
