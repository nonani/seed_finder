// login_usecase.dart

import 'package:seed_finder/data/model/user_model.dart';

import '../entity/User.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserModel?> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
