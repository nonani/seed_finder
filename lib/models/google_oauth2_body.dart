import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_oauth2_body.freezed.dart';
part 'google_oauth2_body.g.dart';

@Freezed(toJson: true)
class GoogleOAuth2Body with _$GoogleOAuth2Body {
  const factory GoogleOAuth2Body({
    required String googleAccessToken,
  }) = _GoogleOAuth2Body;

  @override
  Map<String, dynamic> toJson();
}
