import 'package:bmi_calculator/features/bmi_detailed_info/data/data_sources/edit_bmi_entry_data_source.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/data/repositories/edit_bmi_entry_repo.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/domain/repositories/base_edit_bmi_entry_repo.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/domain/use_cases/edit_bmi_entry_use_case.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/presentation/manager/bmi_entry_info_bloc.dart';
import 'package:bmi_calculator/features/bmi_entries_history/data/data_sources/delete_bmi_entry_data_source.dart';
import 'package:bmi_calculator/features/bmi_entries_history/data/data_sources/get_bmi_history_data_source.dart';
import 'package:bmi_calculator/features/bmi_entries_history/data/repositories/delete_bmi_entry_repo.dart';
import 'package:bmi_calculator/features/bmi_entries_history/data/repositories/get_bmi_history_repo.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/repositories/base_delete_bmi_entry_repo.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/repositories/base_get_bmi_history_repo.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/delete_bmi_entry_use_case.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/get_bmi_history_use_case.dart';
import 'package:bmi_calculator/features/bmi_entries_history/presentation/manager/bmi_history_bloc.dart';
import 'package:bmi_calculator/features/bmi_form/data/data_sources/save_bmi_data_source.dart';
import 'package:bmi_calculator/features/bmi_form/data/repositories/save_bmi_repo.dart';
import 'package:bmi_calculator/features/bmi_form/domain/repositories/base_save_bmi_repo.dart';
import 'package:bmi_calculator/features/bmi_form/domain/use_cases/save_bmi_use_case.dart';
import 'package:bmi_calculator/features/bmi_form/presentation/manager/bmi_form_bloc.dart';
import 'package:bmi_calculator/features/home/data/data_sources/sign_out_data_source.dart';
import 'package:bmi_calculator/features/home/data/repositories/sign_out_repo.dart';
import 'package:bmi_calculator/features/home/domain/repositories/base_sign_out_repo.dart';
import 'package:bmi_calculator/features/home/domain/use_cases/sign_out_use_case.dart';
import 'package:bmi_calculator/features/home/presentation/manager/home_bloc.dart';
import 'package:bmi_calculator/features/sign_in/data/data_sources/sign_in_data_source.dart';
import 'package:bmi_calculator/features/sign_in/data/repositories/sign_in_repo.dart';
import 'package:bmi_calculator/features/sign_in/domain/repositories/base_sign_in_repo.dart';
import 'package:bmi_calculator/features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:bmi_calculator/features/sign_in/presentation/manager/sign_in_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;
final logger = Logger();

class ServicesLocator {
  void init() {
    /// DATA SOURCE
    sl.registerLazySingleton<BaseSignInDataSource>(
      () => SignInDataSource(),
    );
    sl.registerLazySingleton<BaseSaveBmiDataSource>(
      () => SaveBmiDataSource(),
    );
    sl.registerLazySingleton<BaseGetBmiHistoryDataSource>(
      () => GetBmiHistoryDataSource(),
    );
    sl.registerLazySingleton<BaseDeleteBmiEntryDataSource>(
      () => DeleteBmiEntryDataSource(),
    );
    sl.registerLazySingleton<BaseEditBmiEntryDataSource>(
      () => EditBmiEntryDataSource(),
    );
    sl.registerLazySingleton<BaseSignOutDataSource>(
      () => SignOutDataSource(),
    );

    /// Repository
    sl.registerLazySingleton<BaseSignInRepo>(() => SignInRepo(
          baseSignInDataSource: sl(),
        ));
    sl.registerLazySingleton<BaseSaveBmiRepo>(() => SaveBmiRepo(
          baseSaveBmiDataSource: sl(),
        ));
    sl.registerLazySingleton<BaseGetBmiHistoryRepo>(() => GetBmiHistoryRepo(
          baseGetBmiHistoryDataSource: sl(),
        ));
    sl.registerLazySingleton<BaseDeleteBmiEntryRepo>(() => DeleteBmiEntryRepo(
          baseDeleteBmiEntryDataSource: sl(),
        ));
    sl.registerLazySingleton<BaseEditBmiEntryRepo>(() => EditBmiEntryRepo(
          baseEditBmiEntryDataSource: sl(),
        ));
    sl.registerLazySingleton<BaseSignOutRepo>(() => SignOutRepo(
          baseSignOutDataSource: sl(),
        ));

    /// Use Cases
    sl.registerLazySingleton(() => SignInUseCase(
          baseSignInRepo: sl(),
        ));
    sl.registerLazySingleton(() => SaveBmiUseCase(
          baseSaveBmiRepo: sl(),
        ));
    sl.registerLazySingleton(() => GetBmiHistoryUseCase(
          baseGetBmiHistoryRepo: sl(),
        ));
    sl.registerLazySingleton(() => DeleteBmiEntryUseCase(
          baseDeleteBmiEntryRepo: sl(),
        ));
    sl.registerLazySingleton(() => EditBmiEntryUseCase(
          baseEditBmiEntryRepo: sl(),
        ));
    sl.registerLazySingleton(() => SignOutUseCase(
          baseSignOutRepo: sl(),
        ));

    /// Bloc
    sl.registerFactory<HomeBloc>(() => HomeBloc(
          signOutUseCase: sl(),
        ));
    sl.registerFactory<SignInBloc>(() => SignInBloc(
          signInUseCase: sl(),
        ));
    sl.registerFactory<BmiFormBloc>(() => BmiFormBloc(
          saveBmiUseCase: sl(),
        ));
    sl.registerFactory<BmiHistoryBloc>(() => BmiHistoryBloc(
          getBmiHistoryUseCase: sl(),
          deleteBmiEntryUseCase: sl(),
        ));
    sl.registerFactory<BmiEntryInfoBloc>(() => BmiEntryInfoBloc(
          editBmiUseCase: sl(),
        ));
  }
}
