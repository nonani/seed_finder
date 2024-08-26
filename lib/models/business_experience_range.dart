import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_experience_range.freezed.dart';

part 'business_experience_range.g.dart';

@freezed
class BusinessExperienceRange with _$BusinessExperienceRange {
  factory BusinessExperienceRange({
    required int start,
    required int end,

  }) = _businessExperienceRange;

  factory BusinessExperienceRange.fromJson(Map<String, dynamic> json) => _$BusinessExperienceRangeFromJson(json);


}