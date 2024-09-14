import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/models/chatroom_overview.dart';
import 'package:seed_finder/providers/chat_list_provider.dart';

part 'chatroom_provider.g.dart';

@riverpod
Future<ChatroomOverview> chatroom(ChatroomRef ref, int chatroomId) async {
  final chatList = await ref.watch(chatListProvider.future);
  return chatList.singleWhere((e) => e.id == chatroomId);
}
