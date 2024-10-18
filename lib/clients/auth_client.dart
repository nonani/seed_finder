import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/survey_options/survey/survey_create_body.dart';
import 'package:seed_finder/models/survey_options/survey/survey_options.dart';
import 'package:seed_finder/models/user.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: '/user')
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/login')
  Future<User> login({
    @Field('userEmail') required String email,
    @Field('userPw') required String password,
  });

  @POST('/info')
  Future<dynamic> create({
    @Body() required SurveyCreateBody body,
  });

  @GET('/option')
  Future<SurveyOptions> getOptions();

  //설문에 참여한 유저인지 체크
  @GET('/check')
  Future<Map<String, bool>> checkSurvey();

}
