abstract class IAuthenticationRepo {
  Future<User> login(String email, String password);

  Future<User> register(User user);

  Future<User> getCurrentUser();

  Future<void> logout();
}

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String token;

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
