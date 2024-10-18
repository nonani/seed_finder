import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:seed_finder/models/auth_token.dart';
import 'package:seed_finder/models/google_oauth2_body.dart';
import 'package:seed_finder/models/kakao_oauth2_body.dart';
import 'package:seed_finder/models/reissue_response.dart';

part 'oauth2_client.g.dart';

@RestApi(baseUrl: "/auth")
abstract class OAuth2Client {
  factory OAuth2Client(Dio dio, {String baseUrl}) = _OAuth2Client;

  @POST("/shared/google")
  Future<AuthToken> signInWithGoogle({
    @Body() required GoogleOAuth2Body data,
  });

  @POST("/shared/kakao")
  Future<AuthToken> signInWithKakao({
    @Body() required KakaoOAuth2Body data,
  });

  @POST("/refresh")
  Future<ReissueResponse> reissue(@Field() String refreshToken);
}
