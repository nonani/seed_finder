import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/providers/document_detail_provider.dart';
import 'package:seed_finder/utils/theme.dart';

class DocDetailPage extends ConsumerWidget {
  final int documentId;

  const DocDetailPage({super.key, required this.documentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(DocumentDetailProvider(documentId));
    return Scaffold(
      appBar: AppBar(
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    title: Text(data[index].guideTitle?? '', style: titleLarge,),
                    subtitle: Column(
                      children: [
                        const SizedBox(height: 8.0),
                        MarkdownBody(
                          data: data[index].messageContent?? '',
                          styleSheet: MarkdownStyleSheet(
                            p: bodyMedium,
                            strong: bodyMedium.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
