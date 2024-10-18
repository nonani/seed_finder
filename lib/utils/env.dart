// const String baseUrl = String.fromEnvironment("");
// const String uuid = String.fromEnvironment("UUID");

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnv() async {
  await dotenv.load(); // .env 파일 로드
}

String? get baseUrl => dotenv.env['BASE_URL'];
String? get kakaoNativeAppKey => dotenv.env['KAKAO_NATIVE_APP_KEY'];
