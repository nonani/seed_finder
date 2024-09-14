import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_finder/models/chatroom_overview.dart';
import 'package:seed_finder/utils/formats.dart';
import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/utils/utils.dart';
import 'package:seed_finder/widgets/cdn_image.dart';

class ChatListTile extends StatelessWidget {
  final ChatroomOverview chat;

  const ChatListTile(
    this.chat, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final message = chat.lastMessage ?? "";
    final createdAt = chat.lastMessageCreatedAt.andThen(recent.format) ?? "";

    return GestureDetector(
      onTap: () => context.push("/chats/${chat.id}"),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            CdnImage.circle(
              Icons.person.toString(),
              dimension: 54,
              boxShadow: boxShadow,
              fallback: const Icon(Icons.person, size: 28),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(chat.numberingId, style: titleSmall),
                      const SizedBox(width: 4),
                      Text(
                        chat.title,
                        style: bodySmall.copyWith(color: gray600),
                      ),
                      const Spacer(),
                      Text(
                        createdAt,
                        style: captionSmall.copyWith(color: gray600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            message,
                            style: captionLarge.copyWith(color: gray600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (chat.unreadMessageCount > 0) ...[
                          const SizedBox(width: 18),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            constraints: const BoxConstraints(minWidth: 18),
                            decoration: const ShapeDecoration(
                              color: blue500,
                              shape: StadiumBorder(),
                            ),
                            child: Text(
                              count.format(chat.unreadMessageCount),
                              style: captionSmall.copyWith(color: white),
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
