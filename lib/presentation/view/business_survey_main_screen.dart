import 'package:flutter/material.dart';

import 'business_survey_screen.dart';

class BusinessSurveyMainPage extends StatefulWidget {
  const BusinessSurveyMainPage({super.key});

  @override
  State<BusinessSurveyMainPage> createState() => _BusinessSurveyMainPageState();
}

class _BusinessSurveyMainPageState extends State<BusinessSurveyMainPage> {
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "창업지원사업",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "매칭 테스트",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "나를 도와줄 정부 사업은 없을까?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFB0E0E6),
              borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
              border: Border.all(
                color: const Color(0xFFB0E0E6),
                width: 1, // Set border width
              ),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Text("총 소모시간은 5분 내외입니다."),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFB0E0E6),
              borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
              border: Border.all(
                color: const Color(0xFFB0E0E6),
                width: 1, // Set border width
              ),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Text("본인의 정보를 최대한 정확하게 작성해야\n도움이 되는 정부지원사업을 추천받을 수 있습니다."),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFB0E0E6),
              borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
              border: Border.all(
                color: const Color(0xFFB0E0E6),
                width: 1, // Set border width
              ),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: const Text("제가 필요해서 만든 서비스이며\n여러분의 창업을 진심으로 응원합니다."),
          ),

          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessSurveyPage()));
          }, child: const Text("시작하기")),
        ],
      ),
    );
  }
}
