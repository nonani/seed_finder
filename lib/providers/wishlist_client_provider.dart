import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/clients/wishlist_client.dart';
import 'package:seed_finder/providers/api_dio_provider.dart';

part 'wishlist_client_provider.g.dart';

@riverpod
Future<WishlistClient> wishlistClient(WishlistClientRef ref) async {
  final dio = await ref.watch(apiDioProvider.future);
  return WishlistClient(dio);
}
