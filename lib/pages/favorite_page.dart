import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/widgets/event_list_tile.dart';

import '../providers/wishlist_provider.dart';
import '../utils/theme.dart';
import '../widgets/list_status_widget.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  void initState() {
    super.initState();

    // Invalidate the `wishlistProvider` when the page is opened.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.invalidate(wishlistProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final wishlist = ref.watch(wishlistProvider);

    const emptyWidget = EmptyListWidget(
      title: "저장한 사업 정보가 없습니다.",
      subtitle: "관심있는 사업 정보를 저장해보세요",
    );

    final child = wishlist.when(
      data: (data) {
        if (data.isEmpty) {
          return emptyWidget;
        }

        return Expanded(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const Divider(height: 4, indent: 16, endIndent: 16);
            },
            itemBuilder: (context, index) {
              final event = data[index];
              return EventListTile(event: event);
            },
          ),
        );
      },
      error: (error, stackTrace) => emptyWidget,
      loading: () => const LoadingListWidget(),
    );

    final count = wishlist.maybeWhen(
      data: (data) => data.length,
      orElse: () => 0,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("하트"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: RichText(
              text: TextSpan(
                style: titleSmall,
                children: [
                  const TextSpan(text: "전체 "),
                  TextSpan(
                    text: "$count",
                    style: titleSmall.copyWith(color: blue500),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
