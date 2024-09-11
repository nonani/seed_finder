import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/event.dart';

part 'wishlist_client.g.dart';

@RestApi(baseUrl: "/wishlist")
abstract class WishlistClient {
  factory WishlistClient(Dio dio, {String baseUrl}) = _WishlistClient;

  @POST("/delete/{portfolioId}")
  Future<void> delete(@Path() int portfolioId);

  @GET("/me")
  Future<List<Event>> getAll({
    @Query("page") int? page,
    @Query("size") int? size,
  });

  @POST("/post/{portfolioId}")
  Future<void> add(@Path() int portfolioId);
}
