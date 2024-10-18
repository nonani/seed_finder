// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_overview.freezed.dart';
part 'document_overview.g.dart';

@freezed
class DocumentOverview with _$DocumentOverview {
  const factory DocumentOverview({
    @JsonKey(name: "user_id") required int userId,
    required String title,
    @JsonKey(name: "id") required int documentId,
    @JsonKey(name: "idea_message") String? ideaMessage,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _DocumentOverview;

  factory DocumentOverview.fromJson(Map<String, dynamic> json) =>
      _$DocumentOverviewFromJson(json);
}
