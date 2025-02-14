import 'package:flutter/material.dart';

class ThemeColors {
  // Success Colors (Green)
  static const MaterialColor success = MaterialColor(_successPrimaryValue, <int, Color>{
    50: Color(0xFFE3F5EC),
    100: Color(0xFFB9E7CE),
    200: Color(0xFF8CD7AD),
    300: Color(0xFF5FC78C),
    400: Color(0xFF3EBB73),
    500: Color(_successPrimaryValue),
    600: Color(0xFF0AA14A),
    700: Color(0xFF099542),
    800: Color(0xFF088A3A),
    900: Color(0xFF066E2C),
  });
  static const int _successPrimaryValue = 0xFF0FAA50;

  static const MaterialColor successAccent = MaterialColor(_successAccentValue, <int, Color>{
    100: Color(0xFF98FFC6),
    200: Color(_successAccentValue),
    400: Color(0xFF3CE67E),
    700: Color(0xFF2AD269),
  });
  static const int _successAccentValue = 0xFF54E38D;

  // Info Colors (Blue)
  static const MaterialColor info = MaterialColor(_infoPrimaryValue, <int, Color>{
    50: Color(0xFFE3F1FE),
    100: Color(0xFFB8DCFC),
    200: Color(0xFF89C5FA),
    300: Color(0xFF5AAEF8),
    400: Color(0xFF379CF6),
    500: Color(_infoPrimaryValue),
    600: Color(0xFF006FCF),
    700: Color(0xFF0065C3),
    800: Color(0xFF005CB7),
    900: Color(0xFF0049A3),
  });
  static const int _infoPrimaryValue = 0xFF007BEB;

  static const MaterialColor infoAccent = MaterialColor(_infoAccentValue, <int, Color>{
    100: Color(0xFFC7E5FF),
    200: Color(_infoAccentValue),
    400: Color(0xFF4FAFFF),
    700: Color(0xFF3A9BFF),
  });
  static const int _infoAccentValue = 0xFF6EC6FF;

  // Warning Colors (Orange)
  static const MaterialColor warning = MaterialColor(_warningPrimaryValue, <int, Color>{
    50: Color(0xFFFEF3E0),
    100: Color(0xFFFCDCB3),
    200: Color(0xFFFAC380),
    300: Color(0xFFF7A94D),
    400: Color(0xFFF59926),
    500: Color(_warningPrimaryValue),
    600: Color(0xFFF18B00),
    700: Color(0xFFED8200),
    800: Color(0xFFE97800),
    900: Color(0xFFE46700),
  });
  static const int _warningPrimaryValue = 0xFFF5A623;

  static const MaterialColor warningAccent = MaterialColor(_warningAccentValue, <int, Color>{
    100: Color(0xFFFFE3C2),
    200: Color(_warningAccentValue),
    400: Color(0xFFFFB96E),
    700: Color(0xFFFFA653),
  });
  static const int _warningAccentValue = 0xFFFFC48F;

  // Error Colors (Red)
  static const MaterialColor error = MaterialColor(_errorPrimaryValue, <int, Color>{
    50: Color(0xFFFDE6E5),
    100: Color(0xFFF9C2C1),
    200: Color(0xFFF59995),
    300: Color(0xFFF16F69),
    400: Color(0xFFED504A),
    500: Color(_errorPrimaryValue),
    600: Color(0xFFCA2A26),
    700: Color(0xFFC62520),
    800: Color(0xFFC2201B),
    900: Color(0xFFBB1610),
  });
  static const int _errorPrimaryValue = 0xFFD32F2F;

  static const MaterialColor errorAccent = MaterialColor(_errorAccentValue, <int, Color>{
    100: Color(0xFFFFB6C2),
    200: Color(_errorAccentValue),
    400: Color(0xFFFF697E),
    700: Color(0xFFFF586F),
  });
  static const int _errorAccentValue = 0xFFFF8294;

  // Primary Colors (Deep Red)
  static const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFF2E4E7),
    100: Color(0xFFD9B9C1),
    200: Color(0xFFBB8997),
    300: Color(0xFF9C596D),
    400: Color(0xFF87354F),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF771C32),
    700: Color(0xFF6C192D),
    800: Color(0xFF621528),
    900: Color(0xFF4F0E1E),
  });
  static const int _primaryPrimaryValue = 0xFF8B1C31;

  static const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFFF4081),
    200: Color(_primaryAccentValue),
    400: Color(0xFFCC005A),
    700: Color(0xFFBD0053),
  });
  static const int _primaryAccentValue = 0xFFE91E63;
}
