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