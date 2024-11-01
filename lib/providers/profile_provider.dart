
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/providers/auth_client_provider.dart';

import '../models/profile.dart';
part 'profile_provider.g.dart';


@riverpod
Future<Profile> profile(Ref ref) async {
  final authClient = await ref.watch(authClientProvider.future);
  final profile = await authClient.getProfile();
  return profile;
}
