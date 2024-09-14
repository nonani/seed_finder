import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seed_finder/models/chat.dart';
import 'package:seed_finder/models/chatroom_overview.dart';

part 'chatroom_client.g.dart';

@RestApi(baseUrl: "/chatroom")
abstract class ChatroomClient {
  factory ChatroomClient(Dio dio, {String baseUrl}) = _ChatroomClient;

  // @POST("/{role}/{portfolioId}")
  // Future<Chatroom> createOrEnter(@Path() int portfolioId);

  @GET("/all")
  Future<List<ChatroomOverview>> getAll();

  @GET("/chat-list/{chatroomId}")
  Future<List<Chat>> getChats(@Path() int chatroomId);
}
