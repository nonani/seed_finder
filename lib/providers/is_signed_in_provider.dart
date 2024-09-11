import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/providers/access_token_provider.dart';

part 'is_signed_in_provider.g.dart';

@riverpod
Future<bool> isSignedIn(IsSignedInRef ref) async {
  return ref.watch(
    accessTokenProvider.selectAsync((data) => data != null),
  );
}
