import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_target.freezed.dart';
part 'application_target.g.dart';

@freezed
class ApplicationTarget with _$ApplicationTarget {
  const factory ApplicationTarget({
    required int id,
    required String name,
  }) = _ApplicationTarget;

  factory ApplicationTarget.fromJson(Map<String, dynamic> json) =>
      _$ApplicationTargetFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
