import 'package:http/http.dart' as http;
import 'package:tohacks2021/models/active_sessions_model.dart';
import 'dart:convert';

Future<ActiveSessions> getUserById(id) async {
  final response =
  await http.get(Uri.http('localhost:5000', 'active_sessions', {'id': id}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return ActiveSessions.fromJson(jsonDecode(response.body)['data'][0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.body);
    throw Exception('Failed to load active sessions');
  }
}
