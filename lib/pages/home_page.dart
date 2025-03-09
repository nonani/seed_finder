import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_finder/providers/auth_state_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final userInfo = ref.watch(authStateProvider.notifier);
              userInfo.signOut();
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
