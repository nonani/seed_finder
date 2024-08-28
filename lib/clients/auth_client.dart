import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/user.dart';
import '../models/survey.dart';
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
  Future<dynamic> info({
    @Body() required Survey body,
  });


}
