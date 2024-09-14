import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/chat.dart';
import 'package:seed_finder/models/member_role.dart';
import 'package:seed_finder/models/message.dart';
import 'package:seed_finder/providers/chatroom_client_provider.dart';
import 'package:seed_finder/providers/user_info_provider.dart';

part 'message_list_provider.g.dart';

@riverpod
class MessageList extends _$MessageList {
  @override
  Future<List<Message>> build(int chatroomId) async {
    final chatroomClient = await ref.watch(chatroomClientProvider.future);

    // final chatroom = await chatroomClient.enter(chatroomId);
    // TODO: do not send leave message until server supports it
    // // ref.onDispose(() {
    // //   ref.read(stompProvider.notifier).leave(chatroomId);
    // // });

    // final chats = chatroomClient.getChats(chatroomId);
    final chats = [
      Chat(
        id: 1,
        content: "Hello! This is a test message.",
        role: MemberRole.customer,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Chat(
        id: 2,
        content: "Hi! How are you?",
        role: MemberRole.manager,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      Chat(
        id: 3,
        content: "I'm fine, thanks!",
        role: MemberRole.customer,
        createdAt: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
    ];

    final role = (await ref.read(userInfoProvider.future)).memberRole;

    return chats.map((e) {
      return Message(
        isMe: e.role == role,
        message: e.content,
        createdAt: e.createdAt,
      );
    }).toList();
  }

  Future<void> add(Message message) async {
    state = await AsyncValue.guard(() async {
      final data = await future;
      return [...data, message];
    });
  }
}
