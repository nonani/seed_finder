import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seed_finder/models/region.dart';
import 'package:seed_finder/models/business_experience_range.dart';

part 'survey.freezed.dart';

part 'survey.g.dart';

@freezed
class Survey with _$Survey {
  @JsonSerializable(explicitToJson: true)
  const factory Survey({
    required List<String> businessCategory,
    required List<String> businessRegion,
    required List<String> businessApply,
    required int businessExperience,
    required int businessTargetAge,
  }) = _Survey;
  
  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
  @override
  Map<String, dynamic> toJson() ;
}

/*
interface ISurveyInfo {
  businessCategory: [string, string, ...];
  businessRegion: [string, string, ...];
  businessApply: [string, string , ...];
  businessExperience: [];
  businessTargetAge: number;
}
 */
