class RegisterWithEmailAndPasswordFailure {
  final String message;

  const RegisterWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred"]);

  factory RegisterWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const RegisterWithEmailAndPasswordFailure(
            'Please enter a Strong password.');
      case 'invalid-email':
        return const RegisterWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const RegisterWithEmailAndPasswordFailure(
            'An account already exists for that email');
      case 'too-many-requests':
        return const RegisterWithEmailAndPasswordFailure(
            'Too many sign-up requests. Please try again later.');
      case 'invalid-credential':
        return const RegisterWithEmailAndPasswordFailure('User not found');
      case 'network-request-failed':
        return const RegisterWithEmailAndPasswordFailure(
            'A network error occurred. Please check your connection.');
      case 'operation-not-allowed':
        return const RegisterWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const RegisterWithEmailAndPasswordFailure(
            'No user found with this email');
      case 'invalid-password':
        return const RegisterWithEmailAndPasswordFailure(
            'Invalid password. Please enter a valid password.');
      case 'user-disabled':
        return const RegisterWithEmailAndPasswordFailure('');

      default:
        return const RegisterWithEmailAndPasswordFailure();
    }
  }
}
