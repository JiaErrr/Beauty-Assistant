/// Asset paths for the Beauty Assistant application
class AssetPaths {
  // Private constructor to prevent instantiation
  AssetPaths._();

  // Base paths
  static const String _imagePath = 'assets/images';
  static const String _svgPath = 'assets/svg';
  static const String _iconPath = 'assets/icons';
  static const String _animationPath = 'assets/animations';
  
  // Logo assets
  static const String logoFull = '$_svgPath/logo_full.svg';
  static const String logoIcon = '$_svgPath/logo_icon.svg';
  static const String logoText = '$_svgPath/logo_text.svg';
  
  // Onboarding images
  static const String onboardingBg1 = '$_imagePath/onboarding/bg_1.png';
  static const String onboardingBg2 = '$_imagePath/onboarding/bg_2.png';
  static const String onboardingBg3 = '$_imagePath/onboarding/bg_3.png';
  
  // Navigation icons
  static const String iconHome = '$_iconPath/nav/home.svg';
  static const String iconCamera = '$_iconPath/nav/camera.svg';
  static const String iconProfile = '$_iconPath/nav/profile.svg';
  static const String iconSearch = '$_iconPath/nav/search.svg';
  static const String iconSettings = '$_iconPath/nav/settings.svg';
  
  // Feature icons
  static const String iconSkinAnalysis = '$_iconPath/features/skin_analysis.svg';
  static const String iconColorAnalysis = '$_iconPath/features/color_analysis.svg';
  static const String iconArTryOn = '$_iconPath/features/ar_try_on.svg';
  static const String iconProductRecommendation = '$_iconPath/features/product_recommendation.svg';
  
  // Social icons
  static const String iconGoogle = '$_iconPath/social/google.svg';
  static const String iconFacebook = '$_iconPath/social/facebook.svg';
  static const String iconApple = '$_iconPath/social/apple.svg';
  
  // Product placeholder images
  static const String productPlaceholder = '$_imagePath/placeholders/product_placeholder.png';
  static const String userPlaceholder = '$_imagePath/placeholders/user_placeholder.png';
  
  // Loading animations
  static const String loadingAnimation = '$_animationPath/loading.json';
  static const String successAnimation = '$_animationPath/success.json';
  static const String errorAnimation = '$_animationPath/error.json';
  
  // Background images
  static const String authBackground = '$_imagePath/backgrounds/auth_bg.png';
  static const String homeBackground = '$_imagePath/backgrounds/home_bg.png';
  static const String cameraBackground = '$_imagePath/backgrounds/camera_bg.png';
}