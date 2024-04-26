import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/remote/chat_repo.dart';
import '../../domain/chatbot/i_chat_repo.dart';
import '../../presentation/chatbot/cubit/chatbot_cubit.dart';
import '../../presentation/profile/cubit/profile_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  // region remote
  getIt.registerLazySingleton(() => Dio()
    ..interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseHeader: true,
    )));
  // endregion

  // region Repositories
  getIt.registerLazySingleton<IChatRepo>(() => ChatRepo(getIt<Dio>()));
  // endregion

  // region Cubits
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
  getIt.registerFactory<ChatbotCubit>(() => ChatbotCubit(getIt()));
  // endregion
}
