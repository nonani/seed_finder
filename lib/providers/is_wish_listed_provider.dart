import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/providers/wish_list_ids_provider.dart';

part 'is_wish_listed_provider.g.dart';

@riverpod
Future<bool> isWishListed(IsWishListedRef ref, int eventId) {
  return ref.watch(
    wishListIdsProvider.selectAsync((data) => data.contains(eventId)),
  );
}
