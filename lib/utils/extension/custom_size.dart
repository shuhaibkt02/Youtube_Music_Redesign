import 'package:flutter/material.dart';

extension CustomSize on BuildContext {
  MediaQueryData get _mediaQueryData => MediaQuery.of(this);

  double get width => _mediaQueryData.size.width;
  double get height => _mediaQueryData.size.height;
}

extension CustomTextTheme on BuildContext {
  ThemeData get _themeData => Theme.of(this);
  TextTheme get _textTheme => Theme.of(this).textTheme;
// themedata
  TextTheme get themeData => _themeData.textTheme;

  //title
  TextStyle? get titleLarge => _textTheme.titleLarge;
  TextStyle? get titleMedium => _textTheme.titleMedium;
  TextStyle? get titleSmall => _textTheme.titleSmall;

  //body
  TextStyle? get bodyLarge => _textTheme.bodyLarge;
  TextStyle? get bodyMedium => _textTheme.bodyMedium;
  TextStyle? get bodySmall => _textTheme.bodySmall;
}
