import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/providers/document_detail_provider.dart';

class DocDetailPage extends ConsumerWidget {
  final int documentId;

  const DocDetailPage({super.key, required this.documentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(DocumentDetailProvider(documentId));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document Detail"),
      ),
      body: result.maybeWhen(
        orElse: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].guideTitle),
                subtitle: Text(data[index].messageContent),
              );
            },
          );
        },
      ),
    );
  }
}
