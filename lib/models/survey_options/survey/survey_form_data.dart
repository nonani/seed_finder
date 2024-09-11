import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_form_data.freezed.dart';
part 'survey_form_data.g.dart';


@Freezed(toJson: true)
class SurveyFormData with _$SurveyFormData {
  const factory SurveyFormData({
    required bool enabled,
    required int id,
    required List<String> businessCategory,
    required List<String> businessRegion,
    required List<String> businessApply,
    required int businessExperience,
    required int businessTargetAge,
    required List<bool> visited,
  }) = _SurveyFormData;

  factory SurveyFormData.fromJson(Map<String, dynamic> json) => _$SurveyFormDataFromJson(json);
  @override
  Map<String, dynamic> toJson();
}
