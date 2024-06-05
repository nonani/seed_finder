import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/user.dart';
import '../../domain/usecase/login_usecase.dart';

class AuthProvider with ChangeNotifier {
  final LoginUseCase loginUseCase;

  User? _user;
  User? get user => _user;

  bool get isAuthenticated => _user != null;

  AuthProvider({required this.loginUseCase});

  Future<void> login(String email, String password) async {
  _user = await loginUseCase(email, password);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
