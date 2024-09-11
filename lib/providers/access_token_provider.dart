import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/providers/secure_storage_provider.dart';

import '../utils/logger.dart';

part 'access_token_provider.g.dart';

const String _key = "access_token";

@riverpod
class AccessToken extends _$AccessToken {
  @override
  Future<String?> build() async {
    final storage = ref.watch(storageProvider);
    logger.d("AccessToken build");
    logger.d("AccessToken key: ${await storage.read(key: _key)}");
    return storage.read(key: _key);
  }

  Future<String?> _save(String? value) async {
    final storage = ref.read(storageProvider);
    await storage.write(key: _key, value: value);
    logger.d("AccessToken save: $value");
    return value;
  }

  Future<void> setValue(String value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _save(value));
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _save(null));
  }
}
