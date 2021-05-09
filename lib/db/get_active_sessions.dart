import 'package:http/http.dart' as http;
import 'package:tohacks2021/models/active_sessions_model.dart';
import 'dart:convert';

Future<ActiveSessions> getSessionById(id) async {
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

Future<List<ActiveSessions>> getAllSessions() async {
  final response =
      await http.get(Uri.http('localhost:5000', 'all-active-sessions'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("Response body: " + response.body);
    var responseJSON = jsonDecode(response.body);
    var count = responseJSON['count'];
    List<ActiveSessions> retVal = <ActiveSessions>[];
    for (int i = 0; i < count; ++i) {
      retVal.add(ActiveSessions.fromJson(responseJSON['data'][i]));
    }
    return retVal;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.body);
    throw Exception('Failed to load active sessions');
  }
}
