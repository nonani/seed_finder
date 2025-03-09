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
    final Map<String, String> labels = {
      "1-1": "창업아이템 배경 및 필요성",
      "1-2": "창업아이템 목표시장(고객) 현황 분석",
      "2-1": "창업아이템 현황(준비 정도)",
      "2-2": "창업아이템 실현 및 구체화 방안",
      "3-1": "창업아이템 비즈니스 모델",
      "3-2": "창업아이템 사업화 추진 전략",
      "3-3-1": "사업 전체 로드맵",
      "3-3-2": "협약기간 내 목표 및 달성 방안",
      "3-3-3": "정부지원사업비 집행계획",
      "3-3-4": "자금 필요성 및 조달계획",
      "4-1-1": "대표자(팀) 현황",
      "4-1-2": "외부 협력 현황 및 활용 방안",
      "4-2": "중장기 사회적 가치 도입계획",
    };
    const guideLine = """
※ 창업아이템(제품·서비스)개발 · 구체화개병과 이를 뒷받침할 근거, 동기 등을 제시
① 외부적 배경 및 동기 (예 : 사회 · 경제 · 기술적 관점, 국내 · 외 시장의 문제점 기획 등)
② 내부적 배경 및 동기 (예 : 대표자 경험, 가치관, 비전 등의 관점)
※ 배경에서 발견한 문제점과 해결방안, 필요성, 제품 · 서비스를 개발 · 구체화하려는 목적 기재
                  """;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(labels[numberingId] ?? ""),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: const Text("가이드 라인"),
                    subtitle: Text(guideLine),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "제목을 입력해주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 10,
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "가이드 라인에 해당하는 내용을 입력해주세요",
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
                            content:
                                Text('생성 요청을 보넀습니다. 완료 시 푸시 알림으로 알려드리겠습니다.'),
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
      ),
    );
  }
}
