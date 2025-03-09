import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/providers/is_wish_listed_provider.dart';
import 'package:seed_finder/providers/wish_list_ids_provider.dart';
import 'package:seed_finder/utils/theme.dart';

class FavoriteToggleButton extends ConsumerStatefulWidget {
  final int eventId;

  const FavoriteToggleButton(
    this.eventId, {
    super.key,
  });

  @override
  ConsumerState<FavoriteToggleButton> createState() =>
      _FavoriteToggleButtonState();
}

class _FavoriteToggleButtonState extends ConsumerState<FavoriteToggleButton> {
  Future<void> toggle() async {
    await ref.read(wishListIdsProvider.notifier).toggle(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    final isWishListed =
        ref.watch(isWishListedProvider(widget.eventId)).valueOrNull ?? false;

    return IconButton(
      onPressed: toggle,
      isSelected: isWishListed,
      selectedIcon: const Icon(Icons.favorite, color: red),
      icon: const Icon(Icons.favorite_outline),
    );
  }
}
