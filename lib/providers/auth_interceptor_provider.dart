
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/providers/access_token_provider.dart';

import 'package:seed_finder/utils/logger.dart';

part 'auth_interceptor_provider.g.dart';

@riverpod
Future<Interceptor> authInterceptor(AuthInterceptorRef ref) async {
  final accessToken = await ref.watch(accessTokenProvider.future);
  logger.d("accessToken: $accessToken");
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      if (accessToken != null) {
        options.headers["Authorization"] = accessToken;
      }
      else if (accessToken == null) {
        options.headers.remove("Authorization");
      }
      return handler.next(options);
    },
  );
}
