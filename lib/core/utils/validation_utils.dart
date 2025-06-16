/// Validation utility functions for form validation
class ValidationUtils {
  // Private constructor to prevent instantiation
  ValidationUtils._();

  /// Validates an email address
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    
    // Regular expression for email validation
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }

  /// Validates a password
  /// 
  /// Returns null if valid, error message if invalid
  /// Password must be at least 8 characters long and contain at least one uppercase letter,
  /// one lowercase letter, one number, and one special character