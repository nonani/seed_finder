import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/providers/wishlist_client_provider.dart';
import 'package:seed_finder/providers/wishlist_provider.dart';

part 'wish_list_ids_provider.g.dart';

@riverpod
class WishListIds extends _$WishListIds {
  @override
  Future<Set<int>> build() async {
    final wishlist = await ref.watch(wishlistProvider.future);
    return wishlist.map((e) => e.id).toSet();
  }

  Future<void> toggle(int eventId) async {
    state = await AsyncValue.guard(() async {
      final data = await future;

      final wishlistClient = await ref.read(wishlistClientProvider.future);

      final isWishListed = data.contains(eventId);
      if (!isWishListed) {
        await wishlistClient.add(eventId);
        data.add(eventId);
      } else {
        await wishlistClient.delete(eventId);
        data.remove(eventId);
      }
      return {...data};
    });
  }
}
