  import 'package:freezed_annotation/freezed_annotation.dart';

  part 'business_classification.freezed.dart';
  part 'business_classification.g.dart';

  @freezed
  class BusinessClassification with _$BusinessClassification {
    const factory BusinessClassification({
      required int id,
      required String name,
    }) = _BusinessClassification;


    factory BusinessClassification.fromJson(Map<String, dynamic> json) => _$BusinessClassificationFromJson(json);

    @override
    Map<String, dynamic> toJson();
  }