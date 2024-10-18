import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:seed_finder/clients/document_client.dart';
import 'package:seed_finder/providers/api_dio_provider.dart';

part 'document_client_provider.g.dart';

@riverpod
Future<DocumentClient> documentClient(DocumentClientRef ref) async {
  final dio = await ref.watch(apiDioProvider.future);
  return DocumentClient(dio);
}
