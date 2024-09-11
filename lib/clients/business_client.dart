import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:seed_finder/models/event.dart';

part 'business_client.g.dart';

@RestApi(baseUrl: 'business')
abstract class BusinessClient {
  factory BusinessClient(Dio dio, {String baseUrl}) = _BusinessClient;

  @POST('/events')
  Future<Map<String, List<Event>>> getEvents();
}