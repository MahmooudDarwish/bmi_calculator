import 'package:bmi_calculator/core/services/firebase_service.dart';

abstract class BaseSignOutDataSource {
  Future<void> signOut();
}

class SignOutDataSource implements BaseSignOutDataSource {
  @override
  Future<void> signOut() async {
    try {
      await FirebaseService.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
