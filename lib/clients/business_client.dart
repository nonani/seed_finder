import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/event.dart';

import 'package:seed_finder/models/event_detail.dart';

part 'business_client.g.dart';

@RestApi(baseUrl: '/business')
abstract class BusinessClient {
  factory BusinessClient(Dio dio, {String baseUrl}) = _BusinessClient;

  @GET('/all')
  Future<Map<String, List<Event>>> getAllEvents();

  //business/:businessId
  @GET('/{businessId}')
  Future<EventDetail> getEventDetail(@Path() int businessId);

  @GET("/by-survey")
  Future<Map<String, List<Event>>> getEventsBySurvey();
}
