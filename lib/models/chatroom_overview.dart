// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatroom_overview.freezed.dart';
part 'chatroom_overview.g.dart';

@freezed
class ChatroomOverview with _$ChatroomOverview {
  const factory ChatroomOverview({
    @JsonKey(name: "chatRoomId") required int id,
    required String numberingId,
    required String title,
    String? lastMessage,
    DateTime? lastMessageCreatedAt,
    required int unreadMessageCount,
  }) = _ChatroomOverview;

  factory ChatroomOverview.fromJson(Map<String, dynamic> json) =>
      _$ChatroomOverviewFromJson(json);
}
