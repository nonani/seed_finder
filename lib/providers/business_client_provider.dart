import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/clients/business_client.dart';
import 'package:seed_finder/providers/api_dio_provider.dart';

part 'business_client_provider.g.dart';

@riverpod
Future<BusinessClient> businessClient(BusinessClientRef ref) async {
  final dio = await ref.watch(apiDioProvider.future);
  return BusinessClient(dio);
}
