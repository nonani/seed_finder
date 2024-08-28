import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../clients/auth_client.dart';
import '../models/survey.dart';
import '../providers/auth_client_provider.dart';
import '../providers/user_info_provider.dart';
import '../utils/logger.dart';
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
              logger.d(await authClient.info(body: Survey.defaultValue));


            },
            child: const Text("get info"),
          ),
        ]
      )
    );
  }
}
