import '../../domain/datasource/user_datasource.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<User> getUserById(String id) async {
    try {
      return await dataSource.getUserById(id);
    } catch (e) {
      // 적절한 예외 처리
      rethrow;
    }
  }

  @override
  Future<void> createUser(User user) async {
    try {
      await dataSource.createUser(user);
    } catch (e) {
      // 적절한 예외 처리
      rethrow;
    }
  }
}