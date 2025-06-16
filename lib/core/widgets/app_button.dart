import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Button sizes
enum AppButtonSize { small, medium, large }

/// Button variants
enum AppButtonVariant { primary, secondary, text, outline }

/// A customizable button component that follows the app's design system
class AppButton extends StatelessWidget {
  /// The text to display on the button
  final String text;
  
  /// The callback when the button is pressed
  final VoidCallback? onPressed;
  
  /// The button size
  final AppButtonSize size;
  
  /// The button variant
  final AppButtonVariant variant;
  
  /// Optional icon to display before the text
  final IconData? leadingIcon;
  
  /// Optional icon to display after the text
  final IconData? trailingIcon;
  
  /// Whether the button is in a loading state
  final bool isLoading;
  
  /// Whether the button takes the full width of its parent
  final bool fullWidth;
  
  /// Optional border radius override
  final double? borderRadius;
  
  /// Optional padding override
  final EdgeInsetsGeometry? padding;
  
  /// Optional background color override
  final Color? backgroundColor;
  
  /// Optional text color override
  final Color? textColor;
  
  /// Optional border color override (for outline variant)