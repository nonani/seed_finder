import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/providers/auth_client_provider.dart';

import '../models/survey_options/survey/survey_options.dart';

part 'survey_options_provider.g.dart';

@riverpod
Future<SurveyOptions> getOptions(GetOptionsRef ref) async {
  final authClient = await ref.watch(authClientProvider.future);
  return authClient.getOptions();
}
