import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/models/event.dart';

part 'event_provider.g.dart';
@riverpod
Future<Map<String, List<Event>>> events(EventsRef ref) async {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final businessClient = await ref.watch(businessClientProvider.future);

  // 서버에서 이벤트 데이터를 받아옴
  final response = await businessClient.getEvents();

  // return response;
  // final response ={
  //   DateTime.now(): [
  //     Event(
  //       id: 1,
  //       title: "이벤트1",
  //       category: "이벤트1 설명",
  //       start: DateTime.now(),
  //       end: DateTime.now().add(Duration(days: 1)),
  //     ),
  //     Event(
  //       id: 2,
  //       title: "이벤트2",
  //       category: "이벤트2 설명",
  //       start: DateTime.now().add(Duration(days: 2)),
  //       end: DateTime.now().add(Duration(days: 3)),
  //     ),
  //   ],
  //   DateTime.now().add(Duration(days: 1)): [
  //     Event(
  //       id: 3,
  //       title: "이벤트3",
  //       category: "이벤트3 설명",
  //       start: DateTime.now().add(Duration(days: 1)),
  //       end: DateTime.now().add(Duration(days: 2)),
  //     ),
  //   ],
  // };
  return response;
}