import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// A customizable loading indicator component that follows the app's design system
class AppLoading extends StatelessWidget {
  /// The size of the loading indicator
  final double size;
  
  /// The color of the loading indicator
  final Color? color;
  
  /// The stroke width of the loading indicator
  final double strokeWidth;
  
  /// The text to display below the loading indicator
  final String? text;
  
  /// The background color of the loading container
  final Color? backgroundColor;
  
  /// Whether to show the loading indicator in a container
  final bool withContainer;
  
  /// The padding around the loading indicator
  final EdgeInsetsGeometry padding;

  /// Creates an AppLoading
  const AppLoading({
    Key? key,
    this.size = AppConstants.iconSizeXL,
    this.color,
    this.strokeWidth = 3.0,
    this.text,
    this.backgroundColor,
    this.withContainer = false,
    this.padding = const EdgeInsets.all(AppConstants.paddingM),
  }) : super(key: key);

  /// Creates a small loading indicator
  const AppLoading.small({
    Key? key,
    this.color,
    this.strokeWidth = 2.0,
    this.text,
    this.backgroundColor,
    this.withContainer = false,
    this.padding = const EdgeInsets.all(AppConstants.paddingS),
  }) : size = AppConstants.iconSizeM,
       super(key: key);

  /// Creates a large loading indicator
  const AppLoading.large({
    Key? key,
    this.color,
    this.strokeWidth = 4.0,
    this.text,
    this.backgroundColor,
    this.withContainer = false,
    this.padding = const EdgeInsets.all(AppConstants.paddingL),
  }) : size = 64.0,
       super(key: key);

  /// Creates a fullscreen loading overlay
  const AppLoading.overlay({
    Key? key,
    this.size = AppConstants.iconSizeXL,
    this.color,
    this.strokeWidth = 3.0,
    this.text,
    this.padding = const EdgeInsets.all(AppConstants.paddingM),
  }) : backgroundColor = Colors.black54,
       withContainer = true,
       super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget loadingWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? AppColors.brandPrimary,
            ),
          ),
        ),
        if (text != null) ..[
          const SizedBox(height: AppConstants.spacingM),
          Text(
            text!,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );

    if (withContainer) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: backgroundColor,
        padding: padding,
        child: Center(child: loadingWidget),
      );
    }

    return Padding(
      padding: padding,
      child: loadingWidget,
    );
  }

  /// Shows a loading dialog
  static Future<void> showDialog(
    BuildContext context, {
    String? text,
    bool barrierDismissible = false,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Loading',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                color: AppColors.surfacePrimary,
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusM),
              ),
              child: AppLoading(
                text: text,
                withContainer: false,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
    );
  }

  /// Hides the loading dialog
  static void hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}