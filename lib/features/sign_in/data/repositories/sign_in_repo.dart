import 'package:bmi_calculator/features/sign_in/data/data_sources/sign_in_data_source.dart';
import 'package:bmi_calculator/features/sign_in/domain/repositories/base_sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo extends BaseSignInRepo {
  BaseSignInDataSource baseSignInDataSource;
  SignInRepo({required this.baseSignInDataSource});
  @override
  Future<User?> signIn() async {
    try {
      return await baseSignInDataSource.signIn();
    } catch (e) {
      rethrow;
    }
  }
}
