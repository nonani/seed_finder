import 'package:seed_finder/domain/entity/user.dart';

import '../../domain/datasource/user_datasource.dart';

import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<void> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUserById(String id) async {
    try {
      User user =  (await dataSource.getUserById(id)) as User;
      return user;
    } catch (e) {
      // 적절한 예외 처리
      rethrow;
    }
  }

}