

import 'package:seed_finder/domain/datasource/user_datasource.dart';

import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserDataSource userDataSource;

  AuthRepositoryImpl({required this.userDataSource});

  @override
  Future<User?> login(String email, String password) async {
    return await userDataSource.login(email, password);
  }
}
