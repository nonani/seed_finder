import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/event.dart';
import 'package:seed_finder/models/survey_options/survey/survey_create_body.dart';
import 'package:seed_finder/models/survey_options/survey/survey_form_data.dart';
import 'package:seed_finder/models/survey_options/survey/survey_options.dart';

import '../models/user.dart';

part 'auth_client.g.dart';
@RestApi(baseUrl: 'user')
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






}
