import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_finder/models/document_overview.dart';
import 'package:seed_finder/utils/formats.dart';
import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/utils/utils.dart';
import 'package:seed_finder/widgets/cdn_image.dart';

class ChatListTile extends StatelessWidget {
  final DocumentOverview doc;
  final int index;

  const ChatListTile({required this.index,
    required this.doc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final message = doc.ideaMessage ?? "";
    final createdAt = doc.createdAt.andThen(recent.format) ?? "";

    return GestureDetector(
      onTap: () => context.push("/docs-detail/${doc.documentId}"),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [

            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text("#$index", style: titleSmall),
                      const SizedBox(width: 8),
                      Text(
                        doc.title,
                        style: titleLarge.copyWith(color: gray600),
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
