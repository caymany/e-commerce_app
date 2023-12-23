import 'package:flutter/material.dart';

/// Custom exception class to handle various Firebase authentication-related errors
class DFormatException implements Exception {
  /// The error code associated with the exception
  final String message;

  /// Constructor that takes an error code
  const DFormatException(
      [this.message = 'An unexpected error occurred. Please check your input']);

  ///Create a format exception from a specific error message
  factory DFormatException.fromMessage(String message) {
    return DFormatException(message);
  }

  /// Get the corresponding error message
  String get formattedMessage => message;

  /// Create a format exception from a specific error code
  factory DFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const DFormatException('The email address format is invalid. Please enter a valid email');
      case 'invalid-phone-number-format':
        return const DFormatException('The phone number format is invalid. Please enter a valid phone number');
      case 'invalid-date-format':
        return const DFormatException('The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return const DFormatException('The url format is invalid. Please enter a valid url');
      case 'invalid-credit-card-format':
        return const DFormatException('The credit card format is invalid. Please enter a valid credit card combination');
      case 'invalid-numeric-format':
        return const DFormatException('The numeric format is invalid. Please enter a valid email');
      default:
        return const DFormatException('An unknown error occurred');
    }
  }
}
