import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../clients/wishlist_client.dart';
import 'api_dio_provider.dart';

part 'wishlist_client_provider.g.dart';

@riverpod
Future<WishlistClient> wishlistClient(WishlistClientRef ref) async {
  final dio = await ref.watch(apiDioProvider.future);
  return WishlistClient(dio);
}
