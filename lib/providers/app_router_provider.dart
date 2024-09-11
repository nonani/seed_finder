import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/pages/calendar_page.dart';
import 'package:seed_finder/pages/home_page.dart';
import 'package:seed_finder/pages/login_page.dart';
import 'package:seed_finder/pages/survey_page.dart';
import 'package:seed_finder/providers/is_signed_in_provider.dart';

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
          return "/calendar";
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
        builder: (context, state) => LoginPage(),
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
