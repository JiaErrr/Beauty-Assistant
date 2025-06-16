import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// 应用主题配置
class AppTheme {
  // 私有构造函数，防止实例化
  AppTheme._();

  /// 亮色主题
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // 颜色方案
      colorScheme: const ColorScheme.light(
        primary: AppColors.brandPrimary,
        secondary: AppColors.brandSecondary,
        tertiary: AppColors.brandThird,
        background: AppColors.surfaceDefault,
        surface: AppColors.surfacePink,
        onPrimary: AppColors.textInvert,
        onSecondary: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
        error: Colors.red,
        onError: Colors.white,
      ),

      // 脚手架背景色
      scaffoldBackgroundColor: AppColors.surfaceDefault,

      // 文本主题
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1,
        displayMedium: AppTextStyles.h2,
        headlineLarge: AppTextStyles.titleLG,
        headlineMedium: AppTextStyles.titleP,
        titleLarge: AppTextStyles.bodyBold,
        titleMedium: AppTextStyles.body,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.caption,
        bodySmall: AppTextStyles.smallCaption,
        labelLarge: AppTextStyles.bodyBold,
        labelMedium: AppTextStyles.caption,
        labelSmall: AppTextStyles.smallCaption,
      ),