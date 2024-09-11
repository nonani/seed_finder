import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeNavigationBar extends HookConsumerWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      onTap: (value) {
        switch (value) {
          case 0:
            context.push("/business_plan");
          case 1:
            context.push("/survey");
          case 2:
            context.push("/mypage");
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_chart_rounded),
          label: "사업계획서",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_rounded),
          label: "사업 정보 수정",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: "마이페이지",
        ),
      ],
    );
  }
}
