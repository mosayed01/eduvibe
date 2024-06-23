import 'package:dio/dio.dart';
import 'package:eduvibe/core/route/navigator_helper.dart';
import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/core/utils.dart';
import 'package:eduvibe/domain/authentication/i_authentication_repo.dart';

import '../local/user_data_store.dart';

class AuthenticationRepo implements IAuthenticationRepo {
  final Dio _dio;

  AuthenticationRepo(this._dio, this._dataStore);

  final UserHiveDataStore _dataStore;

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await _dio.post(APIConstants.login,
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        await _dataStore.addUser(user: user);
        return user;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<User> getCurrentUser() async {
    final user = await _dataStore.getUser();

    if (user != null) {
      return Future.value(user);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<void> logout() async {
    final user = await _dataStore.getUser();
    if (user != null) {
      await _dataStore.deleteUser(user: user);
      NavigatorHelper.pushNamedAndRemoveUntil(
        Routes.loginScreen,
      );
    }
  }

  @override
  Future<bool> register(UserRegistration user) async {
    try {
      final response = await _dio.post(APIConstants.register,
          data: user.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw e;
    }
  }
}
