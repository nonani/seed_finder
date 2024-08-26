import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Region {
  gangwon("강원"),
  gyeonggi("경기"),
  gyeongnam("경남"),
  gyeongbuk("경북"),
  gwangju("광주"),
  daegu("대구"),
  daejeon("대전"),
  busan("부산"),
  seoul("서울"),
  sejong("세종"),
  ulsan("울산"),
  incheon("인천"),
  jeonbuk("전북"),
  jeonnam("전남"),
  chungbuk("충북"),
  chungnam("충남"),
  nationwide("전국"),
  ;

  final String name;

  const Region(this.name);

  @override
  String toString() => name;

}