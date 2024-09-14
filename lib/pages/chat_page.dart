import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/pages/chat_text_field.dart';
import 'package:seed_finder/pages/loading_page.dart';
import 'package:seed_finder/providers/chatroom_provider.dart';
import 'package:seed_finder/providers/message_list_provider.dart';
import 'package:seed_finder/utils/formats.dart';
import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/utils/utils.dart';
import 'package:seed_finder/widgets/chat_bubble.dart';

class ChatPage extends ConsumerWidget {
  final int chatroomId;

  const ChatPage({
    super.key,
    required this.chatroomId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatroom = ref.watch(chatroomProvider(chatroomId)).valueOrNull;
    if (chatroom == null) {
      return const LoadingPage();
    }

    final messageList = ref.watch(messageListProvider(chatroomId));

    final bubbles = messageList.maybeWhen<Iterable<Widget>>(
      data: (data) sync* {
        for (final (i, item) in data.indexed) {
          final prev = i == 0 ? null : data[i - 1];
          final next = i == data.length - 1 ? null : data[i + 1];

          if (!DateUtils.isSameDay(item.createdAt, prev?.createdAt)) {
            final date = fullDate.format(item.createdAt);

            yield Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  date,
                  style: captionLarge.copyWith(color: gray800),
                ),
              ),
            );
          }

          DateTime? createdAt = item.createdAt;
          if (item.isMe == next?.isMe &&
              isSameMinute(item.createdAt, next?.createdAt)) {
            createdAt = null;
          }

          yield ChatBubble(
            chatroomId: chatroomId,
            isMe: item.isMe,
            isFirst: item.isMe != prev?.isMe,
            message: item.message,
            createdAt: createdAt,
          );
        }
      },
      orElse: () => [],
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(chatroom.title),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: blue50,
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              // Initially scroll to the bottom
              reverse: true,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                ...bubbles,
                const SizedBox(height: 10),
              ].reversed.toList(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom +
              MediaQuery.of(context).padding.bottom,
        ),
        child: ChatTextField(chatroomId: chatroomId),
      ),
    );
  }
}
