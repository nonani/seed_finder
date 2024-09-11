import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum MemberRole {
  customer,
  manager,
  ;

  static const defaultValue = customer;
}
