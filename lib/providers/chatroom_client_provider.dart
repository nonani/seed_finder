import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/clients/chatroom_client.dart';
import 'package:seed_finder/providers/api_dio_provider.dart';

part 'chatroom_client_provider.g.dart';

@riverpod
Future<ChatroomClient> chatroomClient(ChatroomClientRef ref) async {
  final dio = await ref.watch(apiDioProvider.future);
  return ChatroomClient(dio);
}
