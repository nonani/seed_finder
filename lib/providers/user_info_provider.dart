import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/user.dart';
import 'package:seed_finder/providers/access_token_provider.dart';
import 'package:seed_finder/providers/auth_client_provider.dart';
import 'package:seed_finder/providers/shared_preferences_provider.dart';
import 'package:seed_finder/utils/logger.dart';

part 'user_info_provider.g.dart';

const String _key = "user_info";

@riverpod
class UserInfo extends _$UserInfo {
  @override
  Future<User> build() async {
    final prefs = ref.watch(prefsProvider);

    final value = await prefs.getString(_key);
    if (value == null) {
      logger.d("defaultValue: ${User.defaultValue}");
      return _saveEncoded(User.defaultValue);
    }
    final json = jsonDecode(value) as Map<String, dynamic>;
    logger.d("json: $json");
    logger.d(value);
    return User.fromJson(json);
  }

  Future<User> _saveEncoded(User user) async {
    logger.d(user);
    final prefs = ref.read(prefsProvider);
    logger.d(jsonEncode(user));
    await prefs.setString(_key, jsonEncode(user));
    return user;
  }

  Future<User?> login({required String email, required String pwd}) async {
    state = await AsyncValue.guard(() async {
      try {
        final authClient = await ref.read(authClientProvider.future);
        final data = await future; // future가 null이 아닌지 확인

        logger.d("data: $data");
        final loginResult = await authClient.login(email: email, password: pwd);

        final accesToken =  ref.watch(accessTokenProvider.notifier);
        await accesToken.setValue(loginResult.accessToken.toString());
        final user = data.copyWith(accessToken: loginResult.accessToken);
        return await _saveEncoded(user);
      } catch (e) {
        logger.e("Login error: $e");
        return User.defaultValue;
      }
    });
    return state.value;
  }

  Future<void> logout() async {
    state = await AsyncValue.guard(() async {
      final prefs = ref.read(prefsProvider);
      await prefs.remove(_key);
      final storage = ref.read(accessTokenProvider.notifier);
      await storage.clear();
      return User.defaultValue;
    });
  }
}
