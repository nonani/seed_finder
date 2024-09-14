import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:seed_finder/providers/chat_list_provider.dart';
import 'package:seed_finder/widgets/chat_list_tile.dart';
import 'package:seed_finder/widgets/list_status_widget.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatList = ref.watch(chatListProvider);

    final List<String> items = [
      "1-1. 창업아이템 배경 및 필요성",
      "1-2. 창업아이템 목표시장(고객) 현황 분석",
      "2-1. 창업아이템 현황(준비 정도)",
      "2-2. 창업아이템 실현 및 구체화 방안",
      "3-1. 창업아이템 비즈니스 모델",
      "3-2. 창업아이템 사업화 추진 전략",
      "3-3-1. 사업 전체 로드맵",
      "3-3-2. 협약기간 내 목표 및 달성 방안",
      "3-3-3. 정부지원사업비 집행계획",
      "3-3-4. 자금 필요성 및 조달계획",
      "4-1-1. 대표자(팀) 현황",
      "4-1-2. 외부 협력 현황 및 활용 방안",
      "4-2. 중장기 사회적 가치 도입계획"
    ];

    const emptyWidget = EmptyListWidget(
      title: "AI 대화 중인 사업계획서 작성이 없습니다",
      subtitle: "AI와 함께 사업계획서를 작성해보아요",
    );

    final chatListWidget = chatList.when(
      data: (data) {
        if (data.isEmpty) {
          return emptyWidget;
        }

        return Expanded(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final chat = data[index];
              return ChatListTile(chat);
            },
          ),
        );
      },
      error: (error, stackTrace) => emptyWidget,
      loading: () => const LoadingListWidget(),
    );

    // DraggableScrollableController를 생성하여 시트를 제어
    final draggableController = DraggableScrollableController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅"),
      ),
      body: GestureDetector(
        // 화면을 탭했을 때 DraggableScrollableSheet 최소화
        onTap: () {
          draggableController.animateTo(
            0.1, // 최소화 상태 (10% 크기)
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 24),
                chatListWidget, // 채팅 리스트를 Column에 추가
              ],
            ),
            DraggableScrollableSheet(
              controller: draggableController, // 컨트롤러 연결
              initialChildSize: 0.1,
              minChildSize: 0.1,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return GestureDetector(
                  // 바텀시트 내부에서는 onTap이 전파되지 않도록
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Center(
                            child: SizedBox(
                              width: 40,
                              height: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          ListView.separated(
                            shrinkWrap: true, // 내부 스크롤 허용
                            physics:
                                const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                            itemCount: items.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  items[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  // 각 항목을 클릭했을 때 실행할 동작
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
