
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@Freezed(toJson: true)
class Event with _$Event {
  factory Event({
    required int id,
    required String title,
    required String category,
    required DateTime start,
    required DateTime end,
  }) = _Event;
  
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  Map<String, dynamic> toJson();
}