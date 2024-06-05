

import 'package:seed_finder/domain/datasource/user_datasource.dart';

import '../../domain/entity/User.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserDataSource userDataSource;

  AuthRepositoryImpl({required this.userDataSource});

  @override
  Future<UserModel?> login(String email, String password) async {
    return await userDataSource.login(email, password);
  }
}
