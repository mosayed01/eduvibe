import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/authentication/i_authentication_repo.dart';

class UserHiveDataStore {
  static const boxName = "userBox";
  final Box<User> box = Hive.box<User>(boxName);

  /// Add new User
  Future<void> addUser({required User user}) async {
    await box.put(0, user);
  }

  /// Show User
  Future<User?> getUser() async {
    return box.get(0);
  }

  /// Update User
  Future<void> updateUser({required User user}) async {
    await user.save();
  }

  /// Delete User
  Future<void> deleteUser({required User user}) async {
    await user.delete();
  }

  ValueListenable<Box<User>> listenToUser() {
    return box.listenable();
  }
}
