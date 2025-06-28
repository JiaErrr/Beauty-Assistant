/// API constants for the Beauty Assistant application
class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  // Base URLs
  static const String baseUrl = 'https://api.beautyassistant.com';
  static const String imageBaseUrl = 'https://images.beautyassistant.com';

  // API versions
  static const String apiV1 = '/api/v1';
  static const String apiV2 = '/api/v2';

  // Endpoints - Authentication
  static const String endpointSignIn = '$apiV1/auth/signin';
  static const String endpointSignUp = '$apiV1/auth/signup';
  static const String endpointRefreshToken = '$apiV1/auth/refresh';
  static const String endpointForgotPassword = '$apiV1/auth/forgot-password';
  static const String endpointResetPassword = '$apiV1/auth/reset-password';

  // Endpoints - User
  static const String endpointUserProfile = '$apiV1/user/profile';
  static const String endpointUpdateProfile = '$apiV1/user/profile/update';
  static const String endpointChangePassword = '$apiV1/user/password/change';

  // Endpoints - Beauty Products
  static const String endpointProducts = '$apiV1/products';
  static const String endpointProductCategories = '$apiV1/products/categories';
  static const String endpointProductDetails = '$apiV1/products/';
  static const String endpointProductReviews = '$apiV1/products/reviews';
  static const String endpointProductSearch = '$apiV1/products/search';
  static const String endpointProductRecommendations = '$apiV1/products/recommendations';

  // Endpoints - Face Analysis
  static const String endpointFaceAnalysis = '$apiV2/analysis/face';
  static const String endpointSkinAnalysis = '$apiV2/analysis/skin';
  static const String endpointColorAnalysis = '$apiV2/analysis/color';
  static const String endpointMakeupRecommendation = '$apiV2/analysis/makeup-recommendation';

  // Endpoints - AR Try-On
  static const String endpointArTryOn = '$apiV2/ar/try-on';
  static const String endpointArFilters = '$apiV2/ar/filters';

  // Endpoints - Favorites
  static const String endpointFavorites = '$apiV1/user/favorites';
  static const String endpointAddFavorite = '$apiV1/user/favorites/add';
  static const String endpointRemoveFavorite = '$apiV1/user/favorites/remove';

  // Request timeouts (in seconds)
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;
  static const int sendTimeout = 30;

  // Headers
  static const String headerContentType = 'Content-Type';
  static const String headerAuthorization = 'Authorization';
  static const String headerAccept = 'Accept';
  static const String headerUserAgent = 'User-Agent';

  // Content types
  static const String contentTypeJson = 'application/json';
  static const String contentTypeFormData = 'multipart/form-data';
}