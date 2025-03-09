import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seed_finder/models/survey_options/survey/application_target.dart';
import 'package:seed_finder/models/survey_options/survey/business_classification.dart';
import 'package:seed_finder/models/survey_options/survey/support_region.dart';

part 'survey_options.freezed.dart';

part 'survey_options.g.dart';

@Freezed(toJson: true)
class SurveyOptions with _$SurveyOptions {
  const factory SurveyOptions({
    @Default(["1","2", "3", "4", "5"]) List<String> question,
    @JsonKey(name: "business_classification")
    required List<BusinessClassification> businessClassification,
    @JsonKey(name: "application_target")
    required List<ApplicationTarget> applicationTarget,
    @JsonKey(name: "support_region") required List<SupportRegion> supportRegion,
  }) = _SurveyOptions;

  const SurveyOptions._();

  factory SurveyOptions.fromJson(Map<String, dynamic> json) =>
      _$SurveyOptionsFromJson(json);


  @override
  Map<String, dynamic> toJson();
}
