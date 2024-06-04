import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/datasource/UserDataSource.dart';
import '../../domain/entity/User.dart';

class UserRemoteDataSource implements UserDataSource {
  final String apiUrl = "";

  @override
  Future<User> getUserById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<void> createUser(User user) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create user');
    }
  }
}
