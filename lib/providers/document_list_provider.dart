import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/models/document_overview.dart';
import 'package:seed_finder/models/message.dart';

import 'package:seed_finder/providers/document_client_provider.dart';
import 'package:seed_finder/utils/logger.dart';

import '../models/document_create_body.dart';

part 'document_list_provider.g.dart';

@riverpod
class DocList extends _$DocList {
  @override
  Future<List<DocumentOverview>> build() async {
    final chatroomClient = await ref.watch(documentClientProvider.future);
    return chatroomClient.getAll();
  }

  //add document
  Future<void> addDocument(
      String title, String message, String token, String numberingId) async {
    final chatroomClient = await ref.watch(documentClientProvider.future);
    return await chatroomClient.createChatroom(
      DocumentCreateBody(
        title: title,
        message: message,
        deviceToken: token,
        numberingId: numberingId,
      ),
    );
  }

  //remove document
  Future<void> remove(int documentId) async {
    final chatroomClient = await ref.watch(documentClientProvider.future);
    return await chatroomClient.remove(documentId);
  }
}
