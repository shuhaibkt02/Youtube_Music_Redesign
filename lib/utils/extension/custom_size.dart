import 'package:flutter/material.dart';

extension CustomSize on BuildContext {
  MediaQueryData get _mediaQueryData => MediaQuery.of(this);

  double get width => _mediaQueryData.size.width;
  double get height => _mediaQueryData.size.height;
}

extension CustomTextTheme on BuildContext {
  TextTheme get _themeData => Theme.of(this).textTheme;
  //title
    TextStyle? get titleLarge => _themeData.titleLarge;
    TextStyle? get titleMedium => _themeData.titleMedium;
    TextStyle? get titleSmall => _themeData.titleSmall;

  //body
  TextStyle? get bodyLarge => _themeData.bodyLarge;
  TextStyle? get bodyMedium => _themeData.bodyMedium;
  TextStyle? get bodySmall => _themeData.bodySmall;
}
