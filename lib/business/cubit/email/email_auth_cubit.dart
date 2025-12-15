import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit() : super(EmailAuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
  Future<void> signUp(String name, String email, String password) async {
    emit(EmailAuthLoading());
    try {
      // 1. Create User with Firebase Auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // 2. Save User Data to Firestore 
      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        await _firestore.collection('users').doc(uid).set({
          'name': name,
          'email': email,
          'uid': uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      emit(EmailAuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(EmailAuthError(e.message ?? "Sign up failed"));
    } catch (e) {
      emit(EmailAuthError(e.toString()));
    }
  }


  Future<void> signIn(String email, String password) async {
    emit(EmailAuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(EmailAuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(EmailAuthError(e.message ?? "Sign in failed"));
    }
  }
}
