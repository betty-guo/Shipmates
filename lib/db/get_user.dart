import 'package:http/http.dart' as http;
import 'package:tohacks2021/models/user_model.dart';
import 'dart:convert';

Future<User> getUserById(id) async {
  final response =
      await http.get(Uri.http('localhost:5000', 'users', {'id': id}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return User.fromJson(jsonDecode(response.body)['data'][0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.body);
    throw Exception('Failed to load user');
  }
}
