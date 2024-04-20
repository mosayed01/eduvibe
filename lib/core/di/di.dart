import 'package:get_it/get_it.dart';

import '../../presentation/profile/cubit/profile_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
}