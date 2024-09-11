import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/event.dart';

part 'business_client.g.dart';

@RestApi(baseUrl: '/business')
abstract class BusinessClient {
  factory BusinessClient(Dio dio, {String baseUrl}) = _BusinessClient;

  @GET('/all')
  Future<Map<String, List<Event>>> getEvents();

  //business/:businessId
  @GET('/{businessId}')
  Future<Event> getEventDetail(@Path() String businessId);
}