import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:seed_finder/utils/env.dart';

final dio = Dio()
  // `retrofit` combines `Dio.options.baseUrl` and `RestApi.baseUrl`
  // using `Uri.resolveUri` method. To merge the two URLs correctly,
  // `Dio.options.baseUrl` should end with a trailing slash
  // and `RestApi.baseUrl` should not start with a leading slash.
  ..options.baseUrl = "$baseUrl/"
  // ..options.headers['Content-Type'] = "application/json; charset=UTF-8"
  ..interceptors.add(logInterceptor);

final logInterceptor = PrettyDioLogger(
  // ignore: avoid_redundant_argument_values
  enabled: kDebugMode,
  requestHeader: true,
  requestBody: true,
);
