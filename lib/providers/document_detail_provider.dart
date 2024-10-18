import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/models/document_detail_response.dart';

import 'package:seed_finder/providers/document_client_provider.dart';

part 'document_detail_provider.g.dart';
@riverpod
Future<List<DocumentDetailResponse>> documentDetail (DocumentDetailRef ref, int documentId) async {
  final documentClient = await ref.watch(documentClientProvider.future);
  return documentClient.getDocumentResult(documentId);
}
