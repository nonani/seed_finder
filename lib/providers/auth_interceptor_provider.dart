import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/providers/access_token_provider.dart';
import 'package:seed_finder/providers/auth_state_provider.dart';
import 'package:seed_finder/providers/refresh_token_provider.dart';

part 'auth_interceptor_provider.g.dart';

@riverpod
Interceptor authInterceptor(AuthInterceptorRef ref) {
  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      final accessToken = await ref.read(accessTokenProvider.future);
      if (accessToken != null) {
        options.headers["Authorization"] = "Bearer $accessToken";
      }

      return handler.next(options);
    },
    onError: (error, handler) async {
      final statusCode = error.response?.statusCode;
      if (statusCode == 401) {
        final refreshToken = await ref.read(refreshTokenProvider.future);
        if (refreshToken != null) {
          await ref.read(authStateProvider.notifier).refresh(refreshToken);
          final response = await retry(error.requestOptions);
          return handler.resolve(response);
        }

        await ref.read(authStateProvider.notifier).signOut();
        return handler.next(error);
      }

      return handler.next(error);
    },
  );
}

Future<Response> retry(RequestOptions requestOptions) async {
  return Dio().fetch(requestOptions);
}
