import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/providers/uuid_provider.dart';

part 'is_signed_in_provider.g.dart';

@riverpod
Future<bool> isSignedIn(IsSignedInRef ref) async {
  return ref.watch(
      uuidProvider.selectAsync((data) => data != null),
  );
}
