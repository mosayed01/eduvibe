import 'package:dio/dio.dart';
import 'package:eduvibe/data/local/user_data_store.dart';
import 'package:eduvibe/domain/authentication/i_authentication_repo.dart';
import 'package:eduvibe/presentation/login/login_screen/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/remote/authentication_repo.dart';
import '../../data/remote/chat_repo.dart';
import '../../domain/chatbot/i_chat_repo.dart';
import '../../presentation/chatbot/cubit/chatbot_cubit.dart';
import '../../presentation/profile/cubit/profile_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  // region local
  getIt.registerLazySingleton(() => UserHiveDataStore());
  // endregion

  // region remote
  getIt.registerLazySingleton(() => Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    )));
  // endregion

  // region Repositories
  getIt.registerLazySingleton<IChatRepo>(() => ChatRepo(getIt<Dio>()));
  getIt.registerLazySingleton<IAuthenticationRepo>(
      () => AuthenticationRepo(getIt<Dio>(), getIt<UserHiveDataStore>()));
  // endregion

  // region Cubits
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
  getIt.registerFactory<ChatbotCubit>(() => ChatbotCubit(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // endregion
}
