import 'package:bmi_calculator/core/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseSignInDataSource {
  Future<User?> signIn();
}

class SignInDataSource implements BaseSignInDataSource {
  @override
  Future<User?> signIn() async {
    try {
      UserCredential userCredential = await FirebaseService.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }
}
