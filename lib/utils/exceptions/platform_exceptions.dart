/// Exception class for handling various platform-related errors
class DPlatformException implements Exception {
  final String code;

  DPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your entry';
      case 'TOO_MANY_REQUESTS':
        return 'Too many requests. Please try again later.';
      case 'NETWORK_ERROR':
        return 'Network error. Please check your internet connection.';
      case 'INVALID_INPUT':
        return 'Invalid input. Please provide valid data.';
      case 'RESOURCE_NOT_FOUND':
        return 'Resource not found. Please check the requested item.';

      // Firebase authentication errors
      case 'EMAIL_NOT_VERIFIED':
        return 'Email not verified. Please verify your email.';
      case 'USER_DISABLED':
        return 'User account has been disabled. Contact support for assistance.';
      case 'EMAIL_ALREADY_IN_USE':
        return 'The email address is already in use by another account.';
      case 'WEAK_PASSWORD':
        return 'Password is too weak. Choose a stronger password.';

      // Firebase Firestore errors
      case 'PERMISSION_DENIED':
        return 'Permission denied. You don\'t have the necessary rights to perform this operation.';
      case 'DOCUMENT_NOT_FOUND':
        return 'Document not found. The requested document does not exist.';
      case 'ALREADY_EXISTS':
        return 'Already exists. The document you are trying to add already exists.';

      // Add more cases as needed

      // Default case for unknown errors
      default:
        return 'An unknown error occurred.';
    }
  }
}
