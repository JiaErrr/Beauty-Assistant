import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// A customizable card component that follows the app's design system
class AppCard extends StatelessWidget {
  /// The child widget to display inside the card
  final Widget child;
  
  /// The background color of the card
  final Color? backgroundColor;
  
  /// The border color of the card
  final Color? borderColor;
  
  /// The border width of the card
  final double borderWidth;
  
  /// The border radius of the card
  final double borderRadius;
  
  /// The elevation of the card
  final double elevation;
  
  /// The padding inside the card
  final EdgeInsetsGeometry padding;
  
  /// The margin around the card
  final EdgeInsetsGeometry? margin;
  
  /// Whether the card should take the full width
  final bool fullWidth;
  
  /// Whether the card has a shadow
  final bool hasShadow;
  
  /// The shadow color of the card
  final Color? shadowColor;
  
  /// The callback when the card is tapped
  final VoidCallback? onTap;
  
  /// Whether the card is clickable
  final bool isClickable;

  /// Creates an AppCard
  const AppCard({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = AppConstants.borderRadiusM,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(AppConstants.paddingM),
    this.margin,
    this.fullWidth = false,
    this.hasShadow = true,
    this.shadowColor,
    this.onTap,
    this.isClickable = false,
  }) : super(key: key);

  /// Creates a flat card without elevation or shadow
  const AppCard.flat({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = AppConstants.borderRadiusM,
    this.padding = const EdgeInsets.all(AppConstants.paddingM),
    this.margin,
    this.fullWidth = false,
    this.onTap,
    this.isClickable = false,
  }) : elevation = 0.0,
       hasShadow = false,
       shadowColor = null,
       super(key: key);

  /// Creates a card with rounded corners
  const AppCard.rounded({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(AppConstants.paddingM),
    this.margin,
    this.fullWidth = false,
    this.hasShadow = true,
    this.shadowColor,
    this.onTap,
    this.isClickable = false,
  }) : borderRadius = AppConstants.borderRadiusL,
       super(key: key);

  /// Creates a card with no border radius
  const AppCard.square({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(AppConstants.paddingM),
    this.margin,
    this.fullWidth = false,
    this.hasShadow = true,
    this.shadowColor,
    this.onTap,
    this.isClickable = false,
  }) : borderRadius = 0.0,
       super(key: key);

  /// Creates a clickable card
  const AppCard.clickable({
    Key? key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = AppConstants.borderRadiusM,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(AppConstants.paddingM),
    this.margin,
    this.fullWidth = false,
    this.hasShadow = true,
    this.shadowColor,
  }) : isClickable = true,
       super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget cardContent = Container(
      width: fullWidth ? double.infinity : null,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surfacePrimary,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: shadowColor ?? AppColors.textSecondary.withOpacity(0.1),
                  blurRadius: elevation * 2,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: child,
    );

    if (margin != null) {
      cardContent = Padding(
        padding: margin!,
        child: cardContent,
      );
    }

    if (isClickable || onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}