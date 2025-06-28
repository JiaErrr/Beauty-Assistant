/// String utility functions for common string operations
class StringUtils {
  // Private constructor to prevent instantiation
  StringUtils._();

  /// Checks if a string is null or empty
  /// 
  /// Returns true if the string is null or empty, false otherwise
  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  /// Checks if a string is null, empty, or contains only whitespace
  /// 
  /// Returns true if the string is null, empty, or whitespace, false otherwise
  static bool isNullOrWhitespace(String? value) {
    return value == null || value.trim().isEmpty;
  }

  /// Capitalizes the first letter of a string
  /// 
  /// Example: capitalize('hello world') -> 'Hello world'
  static String capitalize(String value) {
    if (isNullOrEmpty(value)) return value;
    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  /// Capitalizes the first letter of each word in a string
  /// 
  /// Example: capitalizeWords('hello world') -> 'Hello World'
  static String capitalizeWords(String value) {
    if (isNullOrEmpty(value)) return value;
    return value.split(' ').map((word) => capitalize(word)).join(' ');
  }

  /// Converts a string to camelCase
  /// 
  /// Example: toCamelCase('hello world') -> 'helloWorld'
  static String toCamelCase(String value) {
    if (isNullOrEmpty(value)) return value;
    final words = value.split(RegExp(r'[\s_-]+'));
    if (words.isEmpty) return value;
    
    final firstWord = words.first.toLowerCase();
    final remainingWords = words.skip(1).map((word) => capitalize(word));
    
    return firstWord + remainingWords.join('');
  }

  /// Converts a string to snake_case
  /// 
  /// Example: toSnakeCase('helloWorld') -> 'hello_world'
  static String toSnakeCase(String value) {
    if (isNullOrEmpty(value)) return value;
    return value
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'^_'), '')
        .replaceAll(RegExp(r'[\s-]+'), '_')
        .toLowerCase();
  }

  /// Converts a string to kebab-case
  /// 
  /// Example: toKebabCase('helloWorld') -> 'hello-world'
  static String toKebabCase(String value) {
    if (isNullOrEmpty(value)) return value;
    return value
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '-${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'^-'), '')
        .replaceAll(RegExp(r'[\s_]+'), '-')
        .toLowerCase();
  }

  /// Truncates a string to a specified length and adds ellipsis
  /// 
  /// Example: truncate('Hello World', 5) -> 'Hello...'
  static String truncate(String value, int maxLength, {String suffix = '...'}) {
    if (isNullOrEmpty(value) || value.length <= maxLength) return value;
    return value.substring(0, maxLength) + suffix;
  }

  /// Removes all whitespace from a string
  /// 
  /// Example: removeWhitespace('hello world') -> 'helloworld'
  static String removeWhitespace(String value) {
    if (isNullOrEmpty(value)) return value;
    return value.replaceAll(RegExp(r'\s+'), '');
  }

  /// Removes extra whitespace and trims the string
  /// 
  /// Example: normalizeWhitespace('  hello   world  ') -> 'hello world'
  static String normalizeWhitespace(String value) {
    if (isNullOrEmpty(value)) return value;
    return value.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Checks if a string contains only digits
  /// 
  /// Returns true if the string contains only digits, false otherwise
  static bool isNumeric(String value) {
    if (isNullOrEmpty(value)) return false;
    return RegExp(r'^\d+$').hasMatch(value);
  }

  /// Checks if a string contains only alphabetic characters
  /// 
  /// Returns true if the string contains only letters, false otherwise
  static bool isAlphabetic(String value) {
    if (isNullOrEmpty(value)) return false;
    return RegExp(r'^[a-zA-Z]+$').hasMatch(value);
  }

  /// Checks if a string contains only alphanumeric characters
  /// 
  /// Returns true if the string contains only letters and digits, false otherwise
  static bool isAlphanumeric(String value) {
    if (isNullOrEmpty(value)) return false;
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
  }

  /// Generates a random string of specified length
  /// 
  /// Example: generateRandomString(8) -> 'aBc3Def9'
  static String generateRandomString(int length, {bool includeNumbers = true, bool includeSymbols = false}) {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
    
    String chars = letters;
    if (includeNumbers) chars += numbers;
    if (includeSymbols) chars += symbols;
    
    final random = DateTime.now().millisecondsSinceEpoch;
    String result = '';
    
    for (int i = 0; i < length; i++) {
      result += chars[(random + i) % chars.length];
    }
    
    return result;
  }

  /// Masks a string by replacing characters with a mask character
  /// 
  /// Example: maskString('1234567890', 4, 2, '*') -> '1234**7890'
  static String maskString(String value, int visibleStart, int visibleEnd, String maskChar) {
    if (isNullOrEmpty(value) || value.length <= visibleStart + visibleEnd) {
      return value;
    }
    
    final start = value.substring(0, visibleStart);
    final end = value.substring(value.length - visibleEnd);
    final maskLength = value.length - visibleStart - visibleEnd;
    final mask = maskChar * maskLength;
    
    return start + mask + end;
  }
}