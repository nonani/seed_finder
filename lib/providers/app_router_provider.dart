import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seed_finder/pages/calendar_page.dart';
import 'package:seed_finder/pages/create_document_page.dart';
import 'package:seed_finder/pages/document_detail_page.dart';
import 'package:seed_finder/pages/document_list_page.dart';
import 'package:seed_finder/pages/event_detail_page.dart';
import 'package:seed_finder/pages/favorite_page.dart';
import 'package:seed_finder/pages/personal_page.dart';
import 'package:seed_finder/pages/sign_in_page.dart';
import 'package:seed_finder/pages/survey_page.dart';
import 'package:seed_finder/providers/auth_client_provider.dart';
import 'package:seed_finder/providers/survey_check_provider.dart';
import 'package:seed_finder/providers/uuid_provider.dart';

import 'is_signed_in_provider.dart';

part 'app_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final isSignedIn = ValueNotifier(false);
  ref.onDispose(isSignedIn.dispose);
  ref.listen<AsyncValue<bool>>(
    isSignedInProvider,
    (previous, next) {
      // next는 AsyncValue 타입이므로 상태를 확인하고 처리해야 합니다.
      next.when(
        data: (value) {
          // 데이터가 성공적으로 로드된 경우, ValueNotifier를 업데이트합니다.
          isSignedIn.value = value;
        },
        loading: () {
          // 로딩 중일 때의 처리
        },
        error: (err, stack) {
          // 에러가 발생한 경우의 처리
          print('Error: $err');
        },
      );
    },
    fireImmediately: true,
  );
  return GoRouter(
    refreshListenable: isSignedIn,
    initialLocation: "/",
    redirect: (context, state) async {
      final uuid = await ref.read(uuidProvider.future);
      if (uuid == null) {
        return "/sign-in";
      }
      final isSurveyCompleted = await ref.read(isSurveyCompletedProvider.future);
      if (!isSurveyCompleted) {
        return "/survey";
      }
      return null;
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const CalendarPage(),
      ),
      GoRoute(
        path: "/sign-in",
        builder: (context, state) => const SignInPage(),
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
        builder: (context, state) => const DocListPage(),
      ),
      GoRoute(
        path: "/docs-create",
        builder: (context, state) {
          final numberingId = state.uri.queryParameters["id"];
          return CreateDocumentPage(numberingId: numberingId ?? "");
        },
      ),
      GoRoute(
        path: "/docs-detail/:documentId",
        builder: (context, state) => DocDetailPage(
          documentId: int.parse(state.pathParameters["documentId"]!),
        ),
      ),
    ],
  );
}
