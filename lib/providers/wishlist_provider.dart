import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/event.dart';
import 'package:seed_finder/providers/wishlist_client_provider.dart';

part 'wishlist_provider.g.dart';

@riverpod
Future<List<Event>> wishlist(WishlistRef ref) async {
  final wishlistClient = await ref.watch(wishlistClientProvider.future);
  return wishlistClient.getAll();
}
