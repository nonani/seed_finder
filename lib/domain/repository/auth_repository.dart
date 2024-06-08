

import '../entity/user.dart';

abstract class AuthRepository {
  Future<User?> login(String email, String password);
}