import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_finder/providers/auth_client_provider.dart';
import 'package:seed_finder/providers/user_info_provider.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: ()async {
              final userInfo = ref.watch(userInfoProvider.notifier);
              userInfo.logout();
            },
            child: const Text("Logout"),
          ),
          ElevatedButton(
            onPressed: ()async {
              final authClient = await ref.read(authClientProvider.future);
            },
            child: const Text("get info"),
          ),
        ]
      )
    );
  }
}
