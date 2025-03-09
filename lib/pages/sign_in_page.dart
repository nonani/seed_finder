import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:seed_finder/providers/auth_state_provider.dart';
import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/widgets/sign_in_button.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset("assets/logo_title.png", width: 300),
              const Text(
                "정부지원사업 선정 도우미",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: blue700,
                ),
              ),
              const Spacer(flex: 2),
              SignInButton(
                provider: const GoogleOAuth2Provider(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: gray600),
                  borderRadius: BorderRadius.circular(8),
                ),
                prefix: Image.asset(
                  "assets/g-logo.png",
                  width: 18,
                ),
                title: const Text("Google로 로그인"),
              ),
              const SizedBox(height: 10),
              SignInButton(
                provider: const KakaoOAuth2Provider(),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE500),
                  borderRadius: BorderRadius.circular(8),
                ),
                prefix: Image.asset(
                  "assets/kakao_symbol.png",
                  width: 18,
                ),
                title: const Text("카카오로 로그인"),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
