import 'package:freezed_annotation/freezed_annotation.dart';

part 'kakao_oauth2_body.freezed.dart';
part 'kakao_oauth2_body.g.dart';

@Freezed(toJson: true)
class KakaoOAuth2Body with _$KakaoOAuth2Body {
  const factory KakaoOAuth2Body({
    required String kakaoAccessToken,
  }) = _KakaoOAuth2Body;

  @override
  Map<String, dynamic> toJson();
}
