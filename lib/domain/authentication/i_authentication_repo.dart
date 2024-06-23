import 'package:hive/hive.dart';

part 'i_authentication_repo.g.dart';

abstract class IAuthenticationRepo {
  Future<User> login(String email, String password);

  Future<User> register(User user);

  Future<User> getCurrentUser();

  Future<void> logout();
}

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? firstname;
  @HiveField(2)
  final String? lastname;
  @HiveField(3)
  final String? username;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? token;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'token': token,
    };
  }
}
