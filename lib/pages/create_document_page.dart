import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/providers/document_list_provider.dart';
import 'package:seed_finder/utils/theme.dart';

class CreateDocumentPage extends ConsumerWidget {
  final String numberingId;

  const CreateDocumentPage({
    super.key,
    required this.numberingId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("detail"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: blue50,
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "제목을 입력해주세요",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                maxLines: 10,
                controller: messageController,
                decoration: InputDecoration(
                  hintText: "내용을 입력해주세요",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    final fcmToken =
                        await FirebaseMessaging.instance.getToken();
                    ref.read(docListProvider.notifier).addDocument(
                          titleController.text,
                          messageController.text,
                          fcmToken!,
                          numberingId,
                        );
                    //비동기 처리 후 pop 처리 Don't use 'BuildContext's across async gaps
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('생성 요청을 보넀습니다. 완료 시 푸시 알림으로 알려드리겠습니다.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      context.pop();
                    }
                  },
                  child: const Text("생성"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
