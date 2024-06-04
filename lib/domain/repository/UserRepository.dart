import '../entity/User.dart';

abstract class UserRepository {
  Future<User> getUserById(String id);
  Future<void> createUser(User user);
}