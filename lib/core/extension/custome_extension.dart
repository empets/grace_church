import 'package:flutter/material.dart';
import 'package:grace_church/core/style/app_theme.dart';

extension CustomHomeColorExtension on BuildContext {
  AppTypographieTheme get appTypographie =>
      Theme.of(this).extension<AppTypographieTheme>()!;
}

extension AppTypographieColorsheme on BuildContext {
  AppColorsTheme get appColor => Theme.of(this).extension<AppColorsTheme>()!;
}
