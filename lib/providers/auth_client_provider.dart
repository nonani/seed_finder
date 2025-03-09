import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/clients/auth_client.dart';
import 'package:seed_finder/providers/api_dio_provider.dart';

part 'auth_client_provider.g.dart';

@riverpod
Future<AuthClient> authClient(AuthClientRef ref) async {
  final dio = await ref.watch(apiDioProvider.future);
  return AuthClient(dio);
}
