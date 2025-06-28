/// Utility class for string operations and manipulations
class StringUtils {
  StringUtils._();

  /// Capitalizes the first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitalizes the first letter of each word in a string
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) => capitalize(word)).join(' ');
  }

  /// Removes all whitespace from a string
  static String removeWhitespace(String text) {
    return text.replaceAll(RegExp(r'\s+'), '');
  }

  /// Removes extra whitespace and trims the string
  static String normalizeWhitespace(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Checks if a string is null or empty
  static bool isNullOrEmpty(String? text) {
    return text == null || text.isEmpty;
  }

  /// Checks if a string is null, empty, or contains only whitespace
  static bool isNullOrWhitespace(String? text) {
    return text == null || text.trim().isEmpty;
  }

  /// Truncates a string to a specified length and adds ellipsis if needed
  static String truncate(String text, int maxLength, {String ellipsis = '...'}) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength - ellipsis.length) + ellipsis;
  }

  /// Truncates a string to a specified number of words
  static String truncateWords(String text, int maxWords, {String ellipsis = '...'}) {
    final words = text.split(' ');
    if (words.length <= maxWords) return text;
    return words.take(maxWords).join(' ') + ellipsis;
  }

  /// Converts a string to snake_case
  static String toSnakeCase(String text) {
    return text
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'^_'), '')
        .replaceAll(' ', '_')
        .toLowerCase();
  }

  /// Converts a string to camelCase
  static String toCamelCase(String text) {
    final words = text.split(RegExp(r'[\s_-]+'));
    if (words.isEmpty) return text;
    
    final firstWord = words.first.toLowerCase();
    final remainingWords = words.skip(1).map((word) => capitalize(word));
    
    return firstWord + remainingWords.join('');
  }

  /// Converts a string to PascalCase
  static String toPascalCase(String text) {
    final words = text.split(RegExp(r'[\s_-]+'));
    return words.map((word) => capitalize(word)).join('');
  }

  /// Converts a string to kebab-case
  static String toKebabCase(String text) {
    return text
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '-${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'^-'), '')
        .replaceAll(' ', '-')
        .toLowerCase();
  }

  /// Extracts initials from a name (first letter of each word)
  static String getInitials(String name, {int maxInitials = 2}) {
    final words = name.trim().split(RegExp(r'\s+'));
    final initials = words
        .take(maxInitials)
        .map((word) => word.isNotEmpty ? word[0].toUpperCase() : '')
        .where((initial) => initial.isNotEmpty)
        .join('');
    return initials;
  }

  /// Masks a string (useful for sensitive data like phone numbers, emails)
  static String mask(String text, {int visibleStart = 2, int visibleEnd = 2, String maskChar = '*'}) {
    if (text.length <= visibleStart + visibleEnd) return text;
    
    final start = text.substring(0, visibleStart);
    final end = text.substring(text.length - visibleEnd);
    final maskLength = text.length - visibleStart - visibleEnd;
    
    return start + maskChar * maskLength + end;
  }

  /// Masks an email address
  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 2) return email;
    
    final maskedUsername = username[0] + '*' * (username.length - 2) + username[username.length - 1];
    return '$maskedUsername@$domain';
  }

  /// Masks a phone number
  static String maskPhoneNumber(String phoneNumber) {
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanNumber.length < 4) return phoneNumber;
    
    final visibleDigits = cleanNumber.substring(cleanNumber.length - 4);
    final maskedPart = '*' * (cleanNumber.length - 4);
    
    return maskedPart + visibleDigits;
  }

  /// Validates if a string contains only alphabetic characters
  static bool isAlphabetic(String text) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(text);
  }

  /// Validates if a string contains only numeric characters
  static bool isNumeric(String text) {
    return RegExp(r'^[0-9]+$').hasMatch(text);
  }

  /// Validates if a string contains only alphanumeric characters
  static bool isAlphanumeric(String text) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);
  }

  /// Generates a random string of specified length
  static String generateRandomString(int length, {bool includeNumbers = true, bool includeSymbols = false}) {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
    
    String chars = letters;
    if (includeNumbers) chars += numbers;
    if (includeSymbols) chars += symbols;
    
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(length, (index) => chars[(random + index) % chars.length]).join('');
  }

  /// Counts the number of words in a string
  static int wordCount(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }

  /// Counts the number of characters in a string (excluding whitespace)
  static int characterCount(String text, {bool includeWhitespace = false}) {
    if (includeWhitespace) return text.length;
    return text.replaceAll(RegExp(r'\s'), '').length;
  }

  /// Reverses a string
  static String reverse(String text) {
    return text.split('').reversed.join('');
  }

  /// Checks if a string is a palindrome
  static bool isPalindrome(String text) {
    final cleaned = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleaned == reverse(cleaned);
  }

  /// Removes HTML tags from a string
  static String stripHtmlTags(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// Converts a string to a URL-friendly slug
  static String toSlug(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }

  /// Extracts numbers from a string
  static List<int> extractNumbers(String text) {
    final matches = RegExp(r'\d+').allMatches(text);
    return matches.map((match) => int.parse(match.group(0)!)).toList();
  }

  /// Formats a file size in bytes to human-readable format
  static String formatFileSize(int bytes) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    if (bytes == 0) return '0 B';
    
    final i = (bytes.bitLength - 1) ~/ 10;
    final size = bytes / (1 << (i * 10));
    
    return '${size.toStringAsFixed(i == 0 ? 0 : 1)} ${suffixes[i]}';
  }
}