import '../entity/user.dart';

abstract class UserRepository {
  Future<User> getUserById(String id);
  Future<void> createUser(User user);
}