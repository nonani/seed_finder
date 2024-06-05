import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:seed_finder/presentation/provider/auth_provider.dart';
import 'package:seed_finder/presentation/view/signup_screen.dart';

import '../../style/titlestyle.dart';
import '../widgets/custom_edit_textform.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final logger = Logger();
  String email = "";
  String password = "";
  String device_token = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Color(0xffdbdbdb), width: 2.5)),
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
        title: Text("로그인",
            style: featureTitle
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.15,
              child: Center(
                child: Text(
                  "CONNEC",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "EchoDream",
                      fontWeight: FontWeight.w800,
                      color: Color(0xff5f66f2)),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginEditTextForm(
                    label: "이메일",
                    hint: "example@connec.co.kr",
                    isSecret: false,
                    onSaved: (newValue) {
                      email = newValue;
                      print(email);
                    },
                  ),
                  LoginEditTextForm(
                    label: "비밀번호",
                    hint: "비밀번호를 입력해주세요",
                    isSecret: true,
                    onSaved: (newValue) {
                      password = newValue;
                      print(password);
                    },
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Logger logger = Logger();
                            await authProvider.login(email, password);
                            logger.w(authProvider.user?.toJson());
                          }
                        },
                        child: Text(
                          "이메일 로그인",
                          style: TextStyle(
                              fontFamily: "EchoDream",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xff5f66f2),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )))),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ResetPasswordPage(),
                      //     ));
                    },
                    child: Text(
                      "비밀번호 찾기",
                      style: TextStyle(color: Color(0xffbdbdbd)),
                    )),
                SizedBox(
                  height: size.height * 0.01,
                  child: VerticalDivider(
                    color: Color(0xffbdbdbd),
                    //color of divider
                    width: 10,
                    //width space of divider
                    thickness: 1,
                    //thickness of divier line
                    indent: 10,
                    //Spacing at the top of divider.
                    endIndent: 10, //Spacing at the bottom of divider.
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ));
                    },
                    child: Text(
                      "회원가입",
                      style: TextStyle(color: Color(0xffbdbdbd)),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
                  "다른 방법으로 로그인 하기",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            SizedBox(height: size.height * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: size.width * 0.01),
                customImageButton(AssetImage("assets/images/kakao_btn.png"),
                        () async {
                      // _showDialog();
                      await loginWithKakao(context);
                      // Navigator.pop(context);
                    }, 70),
                customImageButton(AssetImage("assets/images/naver_btn.png"),
                        () {
                      print("clicked!!");
                    }, 70),
                customImageButton(AssetImage("assets/images/facebook_btn.png"),
                        () {
                      print("clicked!!");
                    }, 70),
                SizedBox(width: size.width * 0.01),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginWithKakao(BuildContext context) async {

  }

  void getToken() async {
    saveToken(device_token);
  }

  void saveToken(String token) async {

  }
}
Widget customImageButton(AssetImage img, GestureTapCallback onTap, double size) {
  return GestureDetector(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(image: img, fit: BoxFit.cover),
        ),
      ),
      onTap: onTap);
}