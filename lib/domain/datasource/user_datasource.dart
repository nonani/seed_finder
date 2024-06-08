import 'package:http/http.dart' as http;

import '../entity/user.dart';




abstract class UserDataSource {

  Future<User> getUserById(String id);
  Future<void> createUser(User user);
  Future<User> login(String email, String password);
  // 기타 사용자 관련 메서드 추가 가능
}
