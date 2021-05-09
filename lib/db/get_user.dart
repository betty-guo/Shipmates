import 'package:http/http.dart' as http;
import 'dart:convert';

void getUserById(id) async {
  final response =
      await http.get(Uri.http('localhost:5000', 'users', {'id': id}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(jsonDecode(response.body)['data'][0]['name']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}
