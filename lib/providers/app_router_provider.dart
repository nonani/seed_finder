import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/pages/calendar_page.dart';
import 'package:seed_finder/pages/chat_list_page.dart';
import 'package:seed_finder/pages/chat_page.dart';
import 'package:seed_finder/pages/event_detail_page.dart';
import 'package:seed_finder/pages/favorite_page.dart';
import 'package:seed_finder/pages/login_page.dart';
import 'package:seed_finder/pages/personal_page.dart';
import 'package:seed_finder/pages/survey_page.dart';
import 'package:seed_finder/providers/is_signed_in_provider.dart';
import 'package:seed_finder/providers/survey_check_provider.dart';

part 'app_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final isSignedIn = ref.watch(isSignedInProvider).maybeWhen(
        data: (signedIn) => signedIn,
        orElse: () => false,
      );
  final isSurveyCompleted = ref.watch(isSurveyCompletedProvider).maybeWhen(
        data: (completed) => completed,
        orElse: () => false,
      );
  return GoRouter(
    redirect: (context, state) {
      if (isSignedIn) {
        if (isSurveyCompleted) {
          if (state.matchedLocation == '/') {
            return "/home";
          } else if (state.matchedLocation == '/') {
            return "/survey";
          }
          return null;
        } else {
          if (state.matchedLocation == '/') {
            return "/";
          }
        }
        return null;
      }
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: "/survey",
        builder: (context, state) => const SurveyPage(),
      ),
      GoRoute(
        path: "/details/:eventId",
        builder: (context, state) => EventDetailPage(
          eventId: int.parse(state.pathParameters["eventId"]!),
        ),
      ),
      GoRoute(
        path: "/favorite",
        builder: (context, state) => const FavoritePage(),
      ),
      GoRoute(
        path: "/my-page",
        builder: (context, state) => const PersonalPage(),
      ),
      GoRoute(
        path: "/business-plan",
        builder: (context, state) => const ChatListPage(),
      ),
      GoRoute(
        path: "/chats/:chatroomId",
        builder: (context, state) => ChatPage(
          chatroomId: int.parse(state.pathParameters["chatroomId"]!),
        ),
      ),
    ],
  );
}
