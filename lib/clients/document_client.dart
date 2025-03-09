import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/document_create_body.dart';
import 'package:seed_finder/models/document_detail_response.dart';
import 'package:seed_finder/models/document_overview.dart';

part 'document_client.g.dart';

@RestApi(baseUrl: "/docs")
abstract class DocumentClient {
  factory DocumentClient(Dio dio, {String baseUrl}) = _DocumentClient;

  // @POST("/{role}/{portfolioId}")
  // Future<Chatroom> createOrEnter(@Path() int portfolioId);

  @GET("/all")
  Future<List<DocumentOverview>> getAll();

  @GET("/{documentId}")
  Future<List<DocumentDetailResponse>> getDocumentResult(@Path() int documentId);

  @POST("/create")
  Future<void> createChatroom(@Body() DocumentCreateBody body);

  @DELETE("/delete/{documentId}")
  Future<void> remove(@Path() int documentId);


}
