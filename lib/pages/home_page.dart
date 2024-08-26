import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_info_provider.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async {
            final userInfo = ref.watch(userInfoProvider.notifier);
            userInfo.logout();
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
