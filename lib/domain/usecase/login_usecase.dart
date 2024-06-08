// login_usecase.dart



import '../entity/user.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User?> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
