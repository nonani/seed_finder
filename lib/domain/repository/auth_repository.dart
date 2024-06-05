import 'package:seed_finder/data/model/user_model.dart';

import '../entity/User.dart';

abstract class AuthRepository {
  Future<UserModel?> login(String email, String password);
}