import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seed_finder/models/member_role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required MemberRole memberRole,
    String? accessToken,
    String? refreshToken,
  }) = _User;

  static const defaultValue = User(memberRole: MemberRole.defaultValue);
  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson();

}
