/// Custom exception class to handle various Firebase authentication-related errors
class DFirebaseAuthException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code
  DFirebaseAuthException(this.code);

  ///Get the corresponding error messages based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address is invalid. Please use a different email.';
      case 'weak-password':
        return 'The password used is weak. Please use a different password.';
      case 'user-disabled':
        return 'Your account is disabled. Please contact support.';
      case 'user-not-found':
        return 'User not found.';
      case 'wrong-password':
        return 'The password entered is wrong. Please use the correct password.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Enter the correct code or resend.';
      case 'invalid-verification-id':
        return 'Invalid verification id.';
      case 'quota-exceeded':
        return 'Quota exceeded.';
      case 'email-already-exists':
        return 'Email already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'Provider already linked. Please login.';
      default:
        return 'An unexpected Firebase error Occurred. Please try again';
    }
  }
}