import 'package:geolocator/geolocator.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final Position position;
  final String address;

  LocationSuccess({required this.position, required this.address});
}

class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}