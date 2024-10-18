import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/models/document_overview.dart';
import 'package:seed_finder/providers/document_list_provider.dart';

part 'document_provider.g.dart';

@riverpod
Future<DocumentOverview> document(DocumentRef ref, int documentId) async {
  final docList = await ref.watch(docListProvider.future);
  return docList.singleWhere((e) => e.documentId == documentId);
}
