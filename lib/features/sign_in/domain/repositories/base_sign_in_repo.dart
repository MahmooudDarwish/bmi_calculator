import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseSignInRepo {
  Future<User?> signIn();
}
