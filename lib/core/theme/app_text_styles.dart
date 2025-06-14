import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 应用文本样式库 - 基于设计系统的字体规范
class AppTextStyles {
  // 基础字体家族
  static const String _platypiFont = 'Platypi';
  static const String _luckiestGuyFont = 'Luckiest Guy';

  // Title Large - Luckiest Guy
  static const TextStyle titleLG = TextStyle(
    fontFamily: _luckiestGuyFont,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 24 / 20, // line height / font size
    color: AppColors.textPrimary,
  );

  // H1 - Platypi ExtraBold
  static const TextStyle h1 = TextStyle(
    fontFamily: _platypiFont,
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 32,
    height: 40 / 32, // line height / font size
    color: AppColors.textPrimary,
  );

  // H2 - Platypi ExtraBold
  static const TextStyle h2 = TextStyle(
    fontFamily: _platypiFont,
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 20,
    height: 28 / 20, // line height / font size
    color: AppColors.textPrimary,
  );

  // Title P - Platypi Bold
  static const TextStyle titleP = TextStyle(
    fontFamily: _platypiFont,
    fontWeight: FontWeight.w700, // Bold
    fontSize: 16,
    height: 24 / 16, // line height / font size
    color: AppColors.textPrimary,
  );

  // Body Bold - Platypi Bold
  static const TextStyle bodyBold = TextStyle(
    fontFamily: _platypiFont,
    fontWeight: FontWeight.w700, // Bold
    fontSize: 16,
    height: 24 / 16, // line height / font size
    color: AppColors.textPrimary,
  );

  // Body - Platypi SemiBold
  static const TextStyle body = TextStyle(
    fontFamily: _platypiFont,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 16,
    height: 24 / 16, // line height / font size
    color: AppColors.textPrimary,
  );

  // Caption - Platypi SemiBold
  static const TextStyle caption = TextStyle(
    fontFamily: _platypiFont,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 14,
    height: 22 / 14, // line height / font size
    color: AppColors.textPrimary,
  );

  // Small Caption - Platypi SemiBold
  static const TextStyle smallCaption = TextStyle(
    fontFamily: _platypiFont,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 12,
    height: 22 / 12, // line height / font size
    color: AppColors.textPrimary,
  );

  // 颜色变体方法
  static TextStyle titleLGWithColor(Color color) => titleLG.copyWith(color: color);
  static TextStyle h1WithColor(Color color) => h1.copyWith(color: color);
  static TextStyle h2WithColor(Color color) => h2.copyWith(color: color);
  static TextStyle titlePWithColor(Color color) => titleP.copyWith(color: color);
  static TextStyle bodyBoldWithColor(Color color) => bodyBold.copyWith(color: color);
  static TextStyle bodyWithColor(Color color) => body.copyWith(color: color);
  static TextStyle captionWithColor(Color color) => caption.copyWith(color: color);
  static TextStyle smallCaptionWithColor(Color color) => smallCaption.copyWith(color: color);

  // 常用的颜色变体
  static TextStyle get titleLGInvert => titleLGWithColor(AppColors.textInvert);
  static TextStyle get h1Invert => h1WithColor(AppColors.textInvert);
  static TextStyle get h2Invert => h2WithColor(AppColors.textInvert);
  static TextStyle get titlePInvert => titlePWithColor(AppColors.textInvert);
  static TextStyle get bodyBoldInvert => bodyBoldWithColor(AppColors.textInvert);
  static TextStyle get bodyInvert => bodyWithColor(AppColors.textInvert);
  static TextStyle get captionInvert => captionWithColor(AppColors.textInvert);
  static TextStyle get smallCaptionInvert => smallCaptionWithColor(AppColors.textInvert);

  static TextStyle get titleLGSecondary => titleLGWithColor(AppColors.textSecondary);
  static TextStyle get h1Secondary => h1WithColor(AppColors.textSecondary);
  static TextStyle get h2Secondary => h2WithColor(AppColors.textSecondary);
  static TextStyle get titlePSecondary => titlePWithColor(AppColors.textSecondary);
  static TextStyle get bodyBoldSecondary => bodyBoldWithColor(AppColors.textSecondary);
  static TextStyle get bodySecondary => bodyWithColor(AppColors.textSecondary);
  static TextStyle get captionSecondary => captionWithColor(AppColors.textSecondary);
  static TextStyle get smallCaptionSecondary => smallCaptionWithColor(AppColors.textSecondary);

  // Material Design 3 兼容性别名
  static const TextStyle headlineLarge = h1;
  static const TextStyle headlineMedium = h2;
  static const TextStyle titleLarge = titleP;
  static const TextStyle titleMedium = bodyBold;
  static const TextStyle titleSmall = caption;
  static const TextStyle bodyLarge = body;
  static const TextStyle bodyMedium = caption;
  static const TextStyle bodySmall = smallCaption;
}