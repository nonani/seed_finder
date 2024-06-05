import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/datasource/user_datasource.dart';
import '../../domain/entity/user.dart';
import '../model/user_model.dart';

class UserDataSourceImpl implements UserDataSource {
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

  @override
  Future<UserModel> login(String email, String password) async{
    // final response = await http.post(
    //   Uri.parse('https://example.com/login'),
    //   body: {'email': email, 'password': password},
    // );
    //
    // if (response.statusCode == 200) {
    //   return UserModel.fromJson(json.decode(response.body));
    // } else {
    //   throw Exception('Failed to login');
    // }
    return UserModel(id: '1', name: 'John Doe', email: '');
  }
}
