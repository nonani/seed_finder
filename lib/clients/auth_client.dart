import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/utils/dio.dart';

import '../models/user.dart';

part 'auth_client.g.dart';
final AuthClient authClient = AuthClient(dio);


@RestApi(baseUrl: 'user')
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/login')
  Future<User> login({
    @Field('userEmail') required String email,
    @Field('userPw') required String password,
  });





}
