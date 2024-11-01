
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:seed_finder/providers/auth_state_provider.dart';

import 'package:seed_finder/utils/logger.dart';

class SignInButton extends ConsumerWidget {
  final OAuth2Provider provider;
  final BoxDecoration? decoration;
  final Widget prefix;
  final Widget title;

  const SignInButton({
    super.key,
    required this.provider,
    this.decoration,
    required this.prefix,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        try {
          await ref.read(authStateProvider.notifier).signIn(provider);
          logger.d("signed in");



          if (!context.mounted) return;
          context.go("/");
        } on TokenIssuanceException catch (e, s) {
          logger.d("failed to sign in", error: e, stackTrace: s);
          //snackbar 띄우기
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              duration: Duration(seconds: 10), // 스낵바 표시 시간
              action: SnackBarAction(
                label: '확인',
                onPressed: () {
                  // 스낵바 액션 버튼을 눌렀을 때의 처리
                },
              ),
            ),
          );

        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: decoration,
        child: Row(
          children: [
            prefix,
            const Spacer(),
            title,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
