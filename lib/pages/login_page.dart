import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_finder/models/user.dart';
import 'package:seed_finder/providers/user_info_provider.dart';
import 'package:seed_finder/utils/theme.dart';
import 'package:seed_finder/widgets/LoginEditTextForm.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    // final userInfo = ref.watch(userInfoProvider.notifier);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login Page",
            style: titleLarge.copyWith(color: Colors.blue),
          ),
          const SizedBox(height: 16),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginEditTextForm(
                  label: "이메일",
                  hint: "example@connec.co.kr",
                  onSaved: (newValue) {
                    email = newValue.toString();
                  },
                  validate: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return "이메일을 입력해주세요";
                    }
                    return null;
                  },
                ),
                LoginEditTextForm(
                  label: "비밀번호",
                  hint: "비밀번호를 입력해주세요",
                  isSecret: true,
                  onSaved: (newValue) {
                    password = newValue.toString();
                  },
                  validate: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return "비밀번호를 입력해주세요";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // if (formKey.currentState?.validate() ?? false) {
                    formKey.currentState?.save();
                    // final loginResult = await ref.read(userInfoProvider.notifier).login(email: email, pwd: password);
                    final loginResult = await ref
                        .read(userInfoProvider.notifier)
                        .login(email: "ex1@naver.com", pwd: "aa1234");

                    if (loginResult == User.defaultValue) {
                      // 로그인 실패 시 SnackBar 표시
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("로그인 실패: 이메일 또는 비밀번호가 잘못되었습니다."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // }
                    }
                  },
                  child: const Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userInfoProvider.notifier).logout();
                  },
                  child: const Text("logout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
