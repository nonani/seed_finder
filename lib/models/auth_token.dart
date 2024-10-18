import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

@Freezed(toJson: false)
class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String uuid,
    required String accessToken,
    required String refreshToken,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
}
