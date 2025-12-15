abstract class EmailAuthState {}

class EmailAuthInitial extends EmailAuthState {}

class EmailAuthLoading extends EmailAuthState {}

class EmailAuthSuccess extends EmailAuthState {}

class EmailAuthError extends EmailAuthState {
  final String message;
  EmailAuthError(this.message);
}
