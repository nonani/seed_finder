import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/event_detail.dart';

import 'package:seed_finder/providers/business_client_provider.dart';

part 'event_detail_provider.g.dart';

@riverpod
Future<EventDetail> eventDetail(EventDetailRef ref, int id) async {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final businessClient = await ref.watch(businessClientProvider.future);

  // 서버에서 이벤트 데이터를 받아옴
  final response = await businessClient.getEventDetail(id);

  return response;
}
