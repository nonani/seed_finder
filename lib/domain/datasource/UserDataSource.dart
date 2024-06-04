import '../entity/User.dart';

abstract class UserDataSource {
  Future<User> getUserById(String id);
  Future<void> createUser(User user);
  // 기타 사용자 관련 메서드 추가 가능
}
