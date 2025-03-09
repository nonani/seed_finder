import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_create_body.freezed.dart';
part 'survey_create_body.g.dart';


@Freezed(toJson: true)
class SurveyCreateBody with _$SurveyCreateBody {
  const factory SurveyCreateBody({
    required List<String> businessCategory,
    required List<String> businessRegion,
    required List<String> businessApply,
    required int businessExperience,
    required int businessTargetAge,
  }) = _Survey;

  @override
  Map<String, dynamic> toJson();
}
