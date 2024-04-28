import 'package:bmi_calculator/features/home/domain/repositories/base_sign_out_repo.dart';

class SignOutUseCase {
  BaseSignOutRepo baseSignOutRepo;

  SignOutUseCase({required this.baseSignOutRepo});

  Future<void> call() async {
    try {
      await baseSignOutRepo.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
