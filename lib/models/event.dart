import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@Freezed(toJson: true)
class Event with _$Event {
  factory Event({
    required int id,
    @JsonKey(name: "integrated_project_name") required String title,
    @JsonKey(name: "business_classification_name") required String category,
    @JsonKey(name: "start_date") required DateTime startDate,
    @JsonKey(name: "end_date") required DateTime endDate,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
