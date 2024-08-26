import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(fieldRename: FieldRename.none)
enum MemberRole {
  customer,
  admin,
  ;

  static const defaultValue = customer;


}
