import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'is_signed_in_provider.dart';

part 'app_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {



  return GoRouter(
    redirect: (context, state) async{
      final isSignedIn = await ref.watch(isSignedInProvider.future);
      if (isSignedIn) {
        return "/home";
      }
      return "/";
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
