import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/providers/access_token_provider.dart';
import 'package:seed_finder/providers/auth_client_provider.dart';
import 'package:seed_finder/providers/user_info_provider.dart';

part 'survey_check_provider.g.dart';

@riverpod
Future<bool> isSurveyCompleted(IsSurveyCompletedRef ref) async {
  final authClient = await ref.watch(authClientProvider.future);
  // 설문 체크 결과를 비동기적으로 받아옴
  final surveyCheckResult = await authClient.checkSurvey();

  // Map에서 "check" 키를 안전하게 가져옴
  return surveyCheckResult["surveyStatus"] ?? false; // 키가 없을 경우 기본값 false 반환
}
