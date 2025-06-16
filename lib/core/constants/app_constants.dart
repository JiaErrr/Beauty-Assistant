import 'package:flutter/material.dart';

/// Application constants - Global static constants for the app
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App information
  static const String appName = 'Beauty Assistant';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  
  // Screen size breakpoints
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double desktopBreakpoint = 1200.0;
  
  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 800);
  
  // Padding and margin values
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;