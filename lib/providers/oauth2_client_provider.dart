import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/clients/oauth2_client.dart';
import 'package:seed_finder/providers/api_dio_provider.dart';

part 'oauth2_client_provider.g.dart';

@riverpod
Future<OAuth2Client> oauth2Client(Oauth2ClientRef ref) async {
  final dio = await ref.watch(apiDioProvider.future);
  return OAuth2Client(dio);
}
