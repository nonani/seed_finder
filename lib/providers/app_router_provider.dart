import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/pages/survey_page.dart';

import '../pages/calendar_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'is_signed_in_provider.dart';

part 'app_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final isSignedIn = ref.watch(isSignedInProvider).maybeWhen(
        data: (signedIn) => signedIn,
        orElse: () => false,
      );

  return GoRouter(
    redirect: (context, state) {
      if (isSignedIn) {
        if (state.matchedLocation == '/') {
          return "/survey";
        }
      } else {
        if (state.matchedLocation == '/') {
          return "/";
        }
      }
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => CalendarPage(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/survey",
        builder: (context, state) => const SurveyPage(),
      ),
      GoRoute(
        path: "/calendar",
        builder: (context, state) => const CalendarPage(),
      ),
    ],
  );
}
