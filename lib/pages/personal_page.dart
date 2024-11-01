import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_finder/providers/auth_state_provider.dart';

import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/widgets/personal_list_tile.dart';
import 'package:seed_finder/widgets/personal_profile_list_tile.dart';

class PersonalPage extends ConsumerWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(onPressed: ()=>ref.read(authStateProvider.notifier).signOut(), icon: const Icon(Icons.logout))
        ],
        title: const Text("마이페이지"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PersonalProfileListTile(),
          const Divider(
            height: 4,
            thickness: 4,
            color: gray100,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13, top: 16, bottom: 10),
            child: Text(
              "내 활동",
              style: TextStyle(
                color: gray600,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          PersonalListTile(
            onTap: () {
              context.push('/favorite');
            },
            title: const Text("저장한 사업 정보"),
            leading: const Icon(Icons.favorite),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13, top: 20, bottom: 10),
            child: Text(
              "고객센터",
              style: TextStyle(
                color: gray600,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          PersonalListTile(
            onTap: () async {
              await ref.watch(authStateProvider.notifier).deleteUser();

            },
            title: const Text("회원 탈퇴"),
            leading: const Icon(Icons.person_remove),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
