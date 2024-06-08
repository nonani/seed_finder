import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:seed_finder/presentation/view/home_screen.dart';

import '../provider/BusinessInfoProvider.dart';
import '../provider/auth_provider.dart';

class BusinessSurveyPage extends StatefulWidget {
  BusinessSurveyPage({super.key});

  @override
  State<BusinessSurveyPage> createState() => _BusinessSurveyPageState();
}

class _BusinessSurveyPageState extends State<BusinessSurveyPage> {
  Logger logger = Logger();
  var _year = 0;
  var _month = 0;
  final List<String> label = [
    "원하는 지원금 분야를 선택해주세요.",
    "대표자가 해당하는 키워드를 선택해주세요.",
    "아이템이 해당하는 키워드를 선택해주세요.",
    "아이템의 포괄적인 특화부분을 선택해주세요.",
    "아이템의 세부적인 특화부분을 선택해주세요.",
    "사업자등록 여부를 선택해주세요.",
    "대표자의 생년월일을 입력해주세요.",
    "최근 3년간 평균 연매출을 입력해주세요.",
    "총 투자받은 금액을 입력해주세요.",
    "지원금 관련 관심있는 지역을 선택해주세요.",
  ];

  final List<List<String>> options = [
    [
      "사업화",
      "기술개발(R&D)",
      "시설/공간/보육",
      "멘토링/컨설팅/교육",
      "행사/네트워크",
      "융자/보증",
      "인력",
      "글로벌진출",
    ],
    [
      "1인창업",
      "귀농귀촌인",
      "대학(원)생",
      "여성",
      "연구원",
      "외국국적",
      "재창업",
      "카이스트",
      "팀창업",
    ],
    [
      "SW인력필요",
      "국가물산업클러스터창업보육센터입주",
      "기술이전",
      "로컬크리에이터",
      "베트남SW관련학과대학(원)생",
      "여성기업종합지원센터입주",
      "영월군창업보육센터입주",
      "전환창업",
      "조인트벤처",
      "지식재산",
      "창업보육센터입주",
      "청년창업사관학교우수졸업",
      "크라우드펀딩",
      "팁스R&D선정",
      "해외현지매출",
    ],
    [
      "4차산업혁명",
      "ESG",
      "공간정보활용",
      "공공기술",
      "공공데이터",
      "기술창업",
      "사회적기업",
      "신산업",
      "예술산업",
      "전자상거래",
      "전통문화산업",
      "제조업",
      "차량활용",
      "해외진출",
      "혁신적사업",
      "환경",
    ],
    [
      "AI",
      "ICT",
      "항공",
      "관광산업",
      "네트워크",
      "녹색산업",
      "농식품",
      "농업",
      "데이터",
      "로봇",
      "물산업",
      "바이오",
      "반도체",
      "반려동물",
      "방사선",
      "보건산업",
      "블록체인",
      "수제창작",
      "스마트디바이스",
      "스포츠산업",
      "에너지",
      "원자력",
      "의료",
      "이차전지",
      "콘텐츠",
      "패션산업",
      "해양수산",
      "헬스",
    ],
    [
      "생애최초",
      "예비창업",
      "0년초과",
      "6개월미만",
      "1년미만",
      "1년초과",
      "2년초과",
      "3년미만",
      "3년초과",
      "4년초과",
      "5년미만",
      "5년초과",
      "7년미만",
      "10년미만",
    ],
    [
      "전국",
      "서울",
      "부산",
      "대구",
      "인천",
      "광주",
      "대전",
      "울산",
      "경기",
      "강원",
      "충북",
      "충남",
      "전북",
      "전남",
      "경북",
      "경남",
      "제주",
      "세종",
    ]
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _updateHeights();
  }

  @override
  Widget build(BuildContext context) {

    final businessInfo = Provider.of<BusinessInfoProvider>(context);
    logger.w(businessInfo.businessInfo.toJson());
    List<Step> stepList = <Step>[
      Step(
        state: businessInfo.index <= 0 ? StepState.editing : StepState.complete,
        title: const Text("원하는 지원금 분야를 선택해주세요."),
        content: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          itemCount: options[0].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.w(businessInfo.businessInfo.type);
                if (businessInfo.businessInfo.type
                    .contains(options[0][index])) {
                  businessInfo.businessInfo.type.remove(options[0][index]);
                } else {
                  businessInfo.businessInfo.type.add(options[0][index]);
                }
                businessInfo.notifyListeners();
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(8.0),
                color:
                    businessInfo.businessInfo.type.contains(options[0][index])
                        ? Colors.blue
                        : Colors.grey,
                child: Center(child: Text(options[0][index])),
              ),
            );
          },
        ),
      ),
      Step(
        state: businessInfo.index <= 1 ? StepState.editing : StepState.complete,
        title: const Text("대표자가 해당하는 키워드를 선택해주세요."),
        content: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          itemCount: options[1].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.w(businessInfo.businessInfo.identity);
                if (businessInfo.businessInfo.identity
                    .contains(options[1][index])) {
                  businessInfo.businessInfo.identity.remove(options[1][index]);
                } else {
                  businessInfo.businessInfo.identity.add(options[1][index]);
                }
                businessInfo.notifyListeners();
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(8.0),
                color: businessInfo.businessInfo.identity
                        .contains(options[1][index])
                    ? Colors.blue
                    : Colors.grey,
                child: Center(child: Text(options[1][index])),
              ),
            );
          },
        ),
      ),
      Step(
        state: businessInfo.index <= 2 ? StepState.editing : StepState.complete,
        title: const Text("아이템이 해당하는 키워드를 선택해주세요."),
        content: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: options[2].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.w(businessInfo.businessInfo.special);
                if (businessInfo.businessInfo.special
                    .contains(options[2][index])) {
                  businessInfo.businessInfo.special.remove(options[2][index]);
                } else {
                  businessInfo.businessInfo.special.add(options[2][index]);
                }
                businessInfo.notifyListeners();
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(8.0),
                color: businessInfo.businessInfo.special
                        .contains(options[2][index])
                    ? Colors.blue
                    : Colors.grey,
                child: Center(child: Text(options[2][index])),
              ),
            );
          },
        ),
      ),
      Step(
        state: businessInfo.index <= 3 ? StepState.editing : StepState.complete,
        title: const Text("아이템의 포괄적인 특화부분을 선택해주세요."),
        content: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: options[3].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.w(businessInfo.businessInfo.I_field);
                if (businessInfo.businessInfo.I_field
                    .contains(options[3][index])) {
                  businessInfo.businessInfo.I_field.remove(options[3][index]);
                } else {
                  businessInfo.businessInfo.I_field.add(options[3][index]);
                }
                businessInfo.notifyListeners();
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(8.0),
                color: businessInfo.businessInfo.I_field
                        .contains(options[3][index])
                    ? Colors.blue
                    : Colors.grey,
                child: Center(child: Text(options[3][index])),
              ),
            );
          },
        ),
      ),
      Step(
        state: businessInfo.index <= 4 ? StepState.editing : StepState.complete,
        title: const Text("아이템의 세부적인 특화부분을 선택해주세요."),
        content: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1.2,
          ),
          itemCount: options[4].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.w(businessInfo.businessInfo.s_field);
                if (businessInfo.businessInfo.s_field
                    .contains(options[4][index])) {
                  businessInfo.businessInfo.s_field.remove(options[4][index]);
                } else {
                  businessInfo.businessInfo.s_field.add(options[4][index]);
                }
                businessInfo.notifyListeners();
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(8.0),
                color: businessInfo.businessInfo.s_field
                        .contains(options[4][index])
                    ? Colors.blue
                    : Colors.grey,
                child: Center(child: Text(options[4][index])),
              ),
            );
          },
        ),
      ),
      Step(
        state: businessInfo.index <= 5 ? StepState.editing : StepState.complete,
        title: const Text("사업자등록 여부를 선택해주세요."),
        content: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: options[5].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.w(businessInfo.businessInfo.period);
                if (businessInfo.businessInfo.period
                    .contains(options[5][index])) {
                  businessInfo.businessInfo.period.remove(options[5][index]);
                } else {
                  businessInfo.businessInfo.period.add(options[5][index]);
                }
                businessInfo.notifyListeners();
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(8.0),
                color:
                    businessInfo.businessInfo.period.contains(options[5][index])
                        ? Colors.blue
                        : Colors.grey,
                child: Center(child: Text(options[5][index])),
              ),
            );
          },
        ),
      ),
      Step(
          state:
              businessInfo.index <= 6 ? StepState.editing : StepState.complete,
          title: const Text("대표자의 생년월일을 입력해주세요."),
          content: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "년",
                    ),
                    onChanged: (value) {
                      _year = int.parse(value);
                      businessInfo.updateAge(calculateAge());
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "월",
                    ),
                    onChanged: (value) {
                      _month = int.parse(value);
                      businessInfo.updateAge(calculateAge());

                    },
                  ),
                ),

              ],
            ),
          )),
      Step(
        state: businessInfo.index <= 7 ? StepState.editing : StepState.complete,
        title: const Text("최근 3년간 평균 연매출을 입력해주세요."),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "연매출(원)",
            ),
            onChanged: (value) {
              businessInfo.updateSale(int.parse(value));
            },
          ),
        ),
      ),
      Step(
        state: businessInfo.index <= 8 ? StepState.editing : StepState.complete,
        title: const Text("총 투자받은 금액을 입력해주세요."),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "투자금액(원)",
            ),
            onChanged: (value) {
              businessInfo.updateInvest(int.parse(value));
            },
          ),
        ),
      ),
      Step(
        state: businessInfo.index <= 9 ? StepState.editing : StepState.complete,
        title: const Text("지원금 관련 관심있는 지역을 선택해주세요."),
        content: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: options[6].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.w(businessInfo.businessInfo.type);
                if (businessInfo.businessInfo.type
                    .contains(options[6][index])) {
                  businessInfo.businessInfo.region.remove(options[6][index]);
                } else {
                  businessInfo.businessInfo.region.add(options[6][index]);
                }
                businessInfo.notifyListeners();
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(8.0),
                color:
                    businessInfo.businessInfo.region.contains(options[6][index])
                        ? Colors.blue
                        : Colors.grey,
                child: Center(child: Text(options[6][index])),
              ),
            );
          },
        ),
      ),
    ];

    return Scaffold(
        body: Stepper(
      type: StepperType.vertical,
      currentStep: businessInfo.index,
      onStepContinue: () {
        if (businessInfo.index == 9) {
          Provider.of<AuthProvider>(context, listen: false)
              .user
              ?.isSurveyCompleted = true;
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          businessInfo.incrementIndex();
        }
      },
      steps: stepList,
      onStepTapped: (index) {
        businessInfo.updateIndex(index);
      },
      onStepCancel: () {
        if (businessInfo.index > 0) businessInfo.decrementIndex();
      },
    ));
  }
  int calculateAge() {
    var now = DateTime.now();
    var age = now.year - _year;
    if (now.month < _month) {
      age--;
    }
    return age;
  }
}