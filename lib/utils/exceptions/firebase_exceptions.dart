/// Custom exception class to handle various Firebase authentication-related errors
class DFirebaseException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code
  DFirebaseException(this.code);

  ///Get the corresponding error messages based on the error code
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience';
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
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance';
      case 'keychain-error':
        return 'A Key chain error occurred. Please check your key chain and try again.';
      case 'internal-error':
        return 'An internal error occurred. Please try again';
      default:
        return 'An unknown error occurred. Please try again later';
    }
  }
}

