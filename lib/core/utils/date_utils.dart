import 'package:intl/intl.dart';

/// Date utility functions for date formatting and manipulation
class DateTimeUtils {
  // Private constructor to prevent instantiation
  DateTimeUtils._();

  /// Formats a date to a string using the specified format
  /// 
  /// Example: formatDate(DateTime.now(), 'MM/dd/yyyy') -> '01/31/2023'
  static String formatDate(DateTime date, String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }

  /// Formats a date to a string with a standard date format (MM/dd/yyyy)
  /// 
  /// Example: formatStandardDate(DateTime.now()) -> '01/31/2023'
  static String formatStandardDate(DateTime date) {
    return formatDate(date, 'MM/dd/yyyy');
  }

  /// Formats a date to a string with a full date format (MMMM d, yyyy)
  /// 
  /// Example: formatFullDate(DateTime.now()) -> 'January 31, 2023'
  static String formatFullDate(DateTime date) {
    return formatDate(date, 'MMMM d, yyyy');
  }

  /// Formats a date to a string with a short date format (MMM d, yyyy)
  /// 
  /// Example: formatShortDate(DateTime.now()) -> 'Jan 31, 2023'
  static String formatShortDate(DateTime date) {
    return formatDate(date, 'MMM d, yyyy');
  }

  /// Formats a date to a string with a time format (h:mm a)
  /// 
  /// Example: formatTime(DateTime.now()) -> '2:30 PM'
  static String formatTime(DateTime date) {
    return formatDate(date, 'h:mm a');
  }

  /// Formats a date to a string with a 24-hour time format (HH:mm)
  /// 
  /// Example: formatTime24(DateTime.now()) -> '14:30'
  static String formatTime24(DateTime date) {
    return formatDate(date, 'HH:mm');
  }

  /// Formats a date to a string with date and time (MM/dd/yyyy h:mm a)
  /// 
  /// Example: formatDateTime(DateTime.now()) -> '01/31/2023 2:30 PM'
  static String formatDateTime(DateTime date) {
    return formatDate(date, 'MM/dd/yyyy h:mm a');
  }

  /// Formats a date to a string with ISO 8601 format
  /// 
  /// Example: formatIso8601(DateTime.now()) -> '2023-01-31T14:30:00.000Z'
  static String formatIso8601(DateTime date) {
    return date.toIso8601String();
  }

  /// Parses a string to a DateTime using the specified format
  /// 
  /// Example: parseDate('01/31/2023', 'MM/dd/yyyy') -> DateTime(2023, 1, 31)
  static DateTime? parseDate(String dateString, String format) {
    try {
      final DateFormat formatter = DateFormat(format);
      return formatter.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Parses an ISO 8601 string to a DateTime
  /// 
  /// Example: parseIso8601('2023-01-31T14:30:00.000Z') -> DateTime(2023, 1, 31, 14, 30)
  static DateTime? parseIso8601(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Gets the difference between two dates in days
  /// 
  /// Example: daysBetween(DateTime(2023, 1, 1), DateTime(2023, 1, 31)) -> 30
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  /// Checks if a date is today
  /// 
  /// Example: isToday(DateTime.now()) -> true
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  /// Checks if a date is yesterday
  /// 
  /// Example: isYesterday(DateTime.now().subtract(Duration(days: 1))) -> true
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day;
  }

  /// Checks if a date is tomorrow
  /// 
  /// Example: isTomorrow(DateTime.now().add(Duration(days: 1))) -> true
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year && date.month == tomorrow.month && date.day == tomorrow.day;
  }

  /// Gets the start of the day for a given date
  /// 
  /// Example: startOfDay(DateTime(2023, 1, 31, 14, 30)) -> DateTime(2023, 1, 31, 0, 0)
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Gets the end of the day for a given date
  /// 
  /// Example: endOfDay(DateTime(2023, 1, 31, 14, 30)) -> DateTime(2023, 1, 31, 23, 59, 59, 999)
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  /// Gets a relative time string (e.g., '2 hours ago', 'in 3 days')
  /// 
  /// Example: getRelativeTime(DateTime.now().subtract(Duration(hours: 2))) -> '2 hours ago'
  static String getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.isNegative) {
      // Future date
      final futureDifference = date.difference(now);
      if (futureDifference.inDays > 0) {
        return 'in ${futureDifference.inDays} day${futureDifference.inDays == 1 ? '' : 's'}';
      } else if (futureDifference.inHours > 0) {
        return 'in ${futureDifference.inHours} hour${futureDifference.inHours == 1 ? '' : 's'}';
      } else if (futureDifference.inMinutes > 0) {
        return 'in ${futureDifference.inMinutes} minute${futureDifference.inMinutes == 1 ? '' : 's'}';
      } else {
        return 'in a few seconds';
      }
    } else {
      // Past date
      if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
      } else {
        return 'just now';
      }
    }
  }
}