import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/event.dart';

part 'wishlist_client.g.dart';

@RestApi(baseUrl: "/favorite")
abstract class WishlistClient {
  factory WishlistClient(Dio dio, {String baseUrl}) = _WishlistClient;

  @DELETE("/delete/{eventId}")
  Future<void> delete(@Path() int eventId);

  @GET("/list")
  Future<List<Event>> getAll({
    @Query("page") int? page,
    @Query("size") int? size,
  });

  @POST("/add/{eventId}")
  Future<void> add(@Path() int eventId);
}
