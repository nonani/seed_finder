import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'access_token_provider.dart';

part 'is_signed_in_provider.g.dart';

@Riverpod(keepAlive: true)
Future<bool> isSignedIn(IsSignedInRef ref) async {
  final token = await ref.watch(accessTokenProvider.future);
  return token != null;
}
