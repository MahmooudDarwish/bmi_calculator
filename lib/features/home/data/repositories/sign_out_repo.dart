import 'package:bmi_calculator/features/home/data/data_sources/sign_out_data_source.dart';
import 'package:bmi_calculator/features/home/domain/repositories/base_sign_out_repo.dart';

class SignOutRepo extends BaseSignOutRepo {
  BaseSignOutDataSource baseSignOutDataSource;

  SignOutRepo({required this.baseSignOutDataSource});
  @override
  Future<void> signOut() async {
    try {
      await baseSignOutDataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
