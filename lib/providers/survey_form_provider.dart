import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/survey_options/survey/survey_create_body.dart';
import 'package:seed_finder/models/survey_options/survey/survey_form_data.dart';
import 'package:seed_finder/providers/auth_client_provider.dart';

part 'survey_form_provider.g.dart';

@riverpod
class SurveyForm extends _$SurveyForm {
  @override
  SurveyFormData build() {
    return const SurveyFormData(
      businessCategory: [],
      businessApply: [],
      businessRegion: [],
      businessTargetAge: 0,
      businessExperience: 0,
      enabled: false,
      id: 0,
      visited: [false, false, false, false, false],
    );
  }

  bool get _enabled =>
      state.businessTargetAge != 0 && state.visited.every((element) => element);

  void setBusinessCategory(List<String> businessCategory) {
    state = state.copyWith(businessCategory: businessCategory);
    state = state.copyWith(visited: state.visited..[0] = true);
  }

  void setBusinessApply(List<String> businessApply) {
    state = state.copyWith(businessApply: businessApply);
    state = state.copyWith(visited: state.visited..[1] = true);
  }

  void setBusinessRegion(List<String> businessRegion) {
    state = state.copyWith(businessRegion: businessRegion);
    state = state.copyWith(visited: state.visited..[2] = true);
  }

  void setBusinessTargetAge(int businessTargetAge) {
    state = state.copyWith(businessTargetAge: businessTargetAge);
    state = state.copyWith(visited: state.visited..[3] = true);
  }

  void setBusinessExperience(int businessExperience) {
    state = state.copyWith(businessExperience: businessExperience);
    state = state.copyWith(visited: state.visited..[4] = true);
  }

  Future<void> submit() async {
    final surveyClient = await ref.read(authClientProvider.future);
    if(!_enabled) {
      return;
    }
    return await surveyClient.create(
      body: SurveyCreateBody(
        businessCategory: state.businessCategory,
        businessRegion: state.businessRegion,
        businessApply: state.businessApply,
        businessExperience: state.businessExperience,
        businessTargetAge: state.businessTargetAge,
      ),
    );
  }

  void incrementIndex() {
    state = state.copyWith(id: state.id + 1);
  }

  void decrementIndex() {
    state = state.copyWith(id: state.id - 1);
  }

  void updateIndex(int index) {
    state = state.copyWith(id: index);
  }
}
