import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/event.dart';

import 'package:seed_finder/providers/business_client_provider.dart';

part 'event_provider.g.dart';

@riverpod
Future<Map<String, List<Event>>> events(EventsRef ref) async {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final businessClient = await ref.watch(businessClientProvider.future);

  // 서버에서 이벤트 데이터를 받아옴
  final response = await businessClient.getEvents();

  return response;
}
