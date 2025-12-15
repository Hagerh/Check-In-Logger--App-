import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkin_state.dart'; 

class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(CheckInInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add Check-In
  Future<void> addCheckIn(String title, String note, double lat, double long, String address) async {
    emit(CheckInLoading());
    try {
      String? uid = _auth.currentUser?.uid;
      if (uid == null) throw Exception("User not logged in");

      await _firestore.collection('users').doc(uid).collection('checkins').add({
        'title': title,
        'note': note,
        'latitude': lat,
        'longitude': long,
        'address': address,
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(CheckInSuccess());
    } catch (e) {
      emit(CheckInError(e.toString()));
    }
  }

  // Delete Check-In
  Future<void> deleteCheckIn(String docId) async {
    try {
      String? uid = _auth.currentUser?.uid;
      if (uid != null) {
        await _firestore.collection('users').doc(uid).collection('checkins').doc(docId).delete();
      }
    } catch (e) {
      emit(CheckInError("Failed to delete: $e"));
    }
  }

  
}