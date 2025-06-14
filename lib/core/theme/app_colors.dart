import 'package:flutter/material.dart';

/// 应用颜色库 - 基于设计系统的颜色规范
class AppColors {
  // 品牌色彩
  static const Color brandPrimary = Color(0xFFDAE4C5);
  static const Color brandSecondary = Color(0xFFE88182);
  static const Color brandThird = Color(0xFFD2ECFB);
  static const Color brandFourth = Color(0xFFFFF2C2);

  // 文本颜色
  static const Color textPrimary = Color(0xFF292929);
  static const Color textSecondary = Color(0xFFE2E2DF);
  static const Color textInvert = Color(0xFFF8F7F6);

  // 图标颜色
  static const Color iconPrimary = Color(0xFF292929);
  static const Color iconSecondary = Color(0xFFE2E2DF);
  static const Color iconInvert = Color(0xFFF8F7F6);

  // 表面颜色
  static const Color surfaceDefault = Color(0xFFFFFEEC);
  static const Color surfacePink = Color(0xFFFAE8DC);

  // 常用颜色别名
  static const Color primary = brandPrimary;
  static const Color secondary = brandSecondary;
  static const Color background = surfaceDefault;
  static const Color surface = surfacePink;
  static const Color onPrimary = textInvert;
  static const Color onSecondary = textPrimary;
  static const Color onBackground = textPrimary;
  static const Color onSurface = textPrimary;

  // 透明度变体
  static Color brandPrimaryWithOpacity(double opacity) => brandPrimary.withOpacity(opacity);
  static Color brandSecondaryWithOpacity(double opacity) => brandSecondary.withOpacity(opacity);
  static Color textPrimaryWithOpacity(double opacity) => textPrimary.withOpacity(opacity);
  static Color textSecondaryWithOpacity(double opacity) => textSecondary.withOpacity(opacity);

  // 渐变色
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [brandPrimary, brandSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient surfaceGradient = LinearGradient(
    colors: [surfaceDefault, surfacePink],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Material Design 3 兼容性
  static const Color outline = Color(0xFFE2E2DF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color error = Color(0xFFB3261E);
}