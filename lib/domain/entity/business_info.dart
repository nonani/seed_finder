class BusinessInfo {
  List<String> type; // 키워드분야
  List<String> identity; // 키워드신분
  List<String> special; // 키워드특이사항
  List<String> I_field; // 키워드특화부분포괄
  List<String> s_field; // 키워드특화부분세부
  List<String> period; // 키워드기간
  int age; // 키워드나이;
  int sale; // 키워드매출
  int invest; // 키워드투자
  List<String> region; // 키워드지역

  BusinessInfo({
    required this.type,
    required this.identity,
    required this.special,
    required this.I_field,
    required this.s_field,
    required this.period,
    required this.age,
    required this.sale,
    required this.invest,
    required this.region,
  });

  // Convert data model to JSON
  Map<String, dynamic> toJson() => {
    'type': type,
    'identity': identity,
    'special': special,
    'I_field': I_field,
    's_field': s_field,
    'period': period,
    'age': age,
    'sale': sale,
    'invest': invest,
    'region': region,
  };

  // Convert JSON to data model
  factory BusinessInfo.fromJson(Map<String, dynamic> json) {
    return BusinessInfo(
      type: json['type'],
      identity: json['identity'],
      special: json['special'],
      I_field: json['I_field'],
      s_field: json['s_field'],
      period: json['period'],
      age: json['age'],
      sale: json['sale'],
      invest: json['invest'],
      region: json['region'],
    );
  }
}
