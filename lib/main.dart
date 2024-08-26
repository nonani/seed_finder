
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_finder/providers/app_router_provider.dart';
import 'package:seed_finder/providers/secure_storage_provider.dart';
import 'package:seed_finder/utils/env.dart';
import 'package:seed_finder/utils/provider_observer.dart';
import 'package:seed_finder/utils/theme.dart';

import 'models/business_experience_range.dart';
import 'models/region.dart';
import 'models/survey.dart';



void main() async{
  await loadEnv(); //

  runApp(
    ProviderScope(
      observers: [MainObserver()],
      child: MyApp(),
    ),
  );

}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.read(storageProvider);
    storage.deleteAll();
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: theme,
    );
  }
}
