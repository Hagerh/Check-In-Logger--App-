import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  //Use Current Location 
  Future<void> getCurrentLocation() async {
    emit(LocationLoading());
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      String address = "Unknown Address";
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        if (placemarks.isNotEmpty) {
          Placemark place = placemarks[0];
          address = "${place.street}, ${place.locality}, ${place.country}";
        }
      } catch (e) {
        address = "Could not fetch address details";
      }

      emit(LocationSuccess(position: position, address: address));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
//MANUALLY 
 
  Future<void> getLocationFromAddress(String addressQuery) async {
    emit(LocationLoading());
    try {
      // 1. Forward Geocoding: Address -> Coordinates
      List<Location> locations = await locationFromAddress(addressQuery);
      
      if (locations.isNotEmpty) {
        Location loc = locations.first;
        
        // Convert to Position object to match our State
        Position position = Position(
          latitude: loc.latitude,
          longitude: loc.longitude,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0, 
          altitudeAccuracy: 0, 
          headingAccuracy: 0
        );

        // 2. Return the result
        emit(LocationSuccess(position: position, address: addressQuery));
      } else {
        emit(LocationError("Address not found"));
      }
    } catch (e) {
      emit(LocationError("Could not find location: ${e.toString()}"));
    }
  }
}