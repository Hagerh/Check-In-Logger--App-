
abstract class CheckInState {}

class CheckInInitial extends CheckInState {}

class CheckInLoading extends CheckInState {}

class CheckInSuccess extends CheckInState {}

class CheckInError extends CheckInState {
  final String message;
  CheckInError(this.message);
}
