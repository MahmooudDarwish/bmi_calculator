import 'package:bmi_calculator/features/sign_in/domain/repositories/base_sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  BaseSignInRepo baseSignInRepo;
  SignInUseCase({required this.baseSignInRepo});

  Future<User?> call() async {
    return await baseSignInRepo.signIn();
  }
}
