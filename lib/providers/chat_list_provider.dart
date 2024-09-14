import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/models/chatroom_overview.dart';
import 'package:seed_finder/models/message.dart';

part 'chat_list_provider.g.dart';

@riverpod
class ChatList extends _$ChatList {
  @override
  Future<List<ChatroomOverview>> build() async {
    // final chatroomClient = await ref.watch(chatroomClientProvider.future);
    // return chatroomClient.getAll();
    await Future.delayed(const Duration(seconds: 2));
    return [
      ChatroomOverview(
        id: 1,
        numberingId: "1-1",
        lastMessage: "Hello!",
        lastMessageCreatedAt:
            DateTime.now().subtract(const Duration(minutes: 5)),
        title: "창업아이템 배경 및 필요성",
        unreadMessageCount: 2,
      ),
      ChatroomOverview(
        id: 2,
        numberingId: "1-2",
        title: "창업아이템 목표시장(고객) 현황 분석",
        lastMessage: "Goodbye!",
        lastMessageCreatedAt:
            DateTime.now().subtract(const Duration(minutes: 30)),
        unreadMessageCount: 5,
      ),
      ChatroomOverview(
        id: 3,
        numberingId: "2-2",
        title: "창업아이템 현황(준비 정도)",
        lastMessage: "What's up?",
        lastMessageCreatedAt: DateTime.now().subtract(const Duration(hours: 1)),
        unreadMessageCount: 0,
      ),
    ];
  }

  Future<void> add(int chatroomId, Message message) async {
    state = await AsyncValue.guard(() async {
      final data = await future;

      final i = data.indexWhere((e) => e.id == chatroomId);
      if (i == -1) {
        return data;
      }

      final overview = data[i];
      data.removeAt(i);

      // final unreadCount = ref.exists(messageListProvider(chatroomId))
      //     ? 0
      //     : overview.unreadMessageCount + 1;
      const unreadCount = 0;

      final newOverview = overview.copyWith(
        lastMessage: message.message,
        lastMessageCreatedAt: message.createdAt,
        unreadMessageCount: unreadCount,
      );
      return [newOverview, ...data];
    });
  }
}
