import 'dart:convert';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/user.dart';
import 'package:seed_finder/providers/shared_preferences_provider.dart';

import '../utils/logger.dart';
import 'access_token_provider.dart';
import 'auth_client_provider.dart';

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
    final prefs = ref.read(prefsProvider);
    await prefs.setString(_key, jsonEncode(user));
    return user;
  }

  Future<User?> login({required String email, required String pwd}) async {
    state = const AsyncValue.loading(); // 로딩 상태로 설정
    print("123");
    state = await AsyncValue.guard(() async {
      try {
        final authClient = await ref.read(authClientProvider.future);
        final data = await future; // future가 null이 아닌지 확인

        logger.d("data: $data");
        final loginResult = await authClient.login(email: email, password: pwd);

        await ref
            .read(accessTokenProvider.notifier)
            .setValue(loginResult.accessToken.toString());

        final user = data.copyWith(accessToken: loginResult.accessToken);
        return await _saveEncoded(user);
      } catch (e) {
        logger.e("Login error: $e");
        return User.defaultValue;
      }
    });
// guard가 끝나면 state의 값 확인
    if (state is AsyncData) {
      final user = state.value; // 성공적으로 반환된 값
      // user를 사용하여 추가 작업 수행
    } else if (state is AsyncError) {
      final error = state.error; // 오류 정보
      state = const AsyncValue.data(User.defaultValue); // 초기 상태로 변경
      // 오류 처리 로직
    }
    return state.value;
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final prefs = ref.read(prefsProvider);
      await prefs.remove(_key);
      final storage = ref.read(accessTokenProvider.notifier);
      await storage.clear();
      return User.defaultValue;
    });
  }
}
