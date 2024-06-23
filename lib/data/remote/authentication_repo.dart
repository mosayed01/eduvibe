import 'package:dio/dio.dart';
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
  Future<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
