import 'package:http/http.dart' as http;
import 'dart:convert';

void postSession(
    String website, String deadline, String currentShippingPrice) async {
  var url = Uri.parse('http://localhost:5000/active-sessions');
  Map<String, String> headersInfo = {"Content-type": "application/json"};
  Object bodyContent = jsonEncode({
    'url': website,
    'deadline': deadline,
    'current_shipping_price': currentShippingPrice,
    'num_people': '1',
    'max_people': '10',
    'users': ["0655855e-8be7-4478-bac2-80932b4deec2"],
    'items': [],
    'host': '0655855e-8be7-4478-bac2-80932b4deec2',
    'state': 'Collecting'
  });
  var response = await http.post(url, headers: headersInfo, body: bodyContent);

  /*curl --location --request POST 'http://localhost:5000/active-sessions' \
--data-raw '{   
   "url": "https://www.aritzia.com/",
   "deadline": "May 11, 2021",
   "current_shipping_price": "40",
   "num_people": 1,
   "max_people": 10,
   "users": [
       "0655855e-8be7-4478-bac2-80932b4deec2"
   ],
   "items": [
       ["https://www.aritzia.com/en/product/wander-blouse/82942.html?dwvar_82942_color=19947", "88", "0655855e-8be7-4478-bac2-80932b4deec2"],
       ["https://www.aritzia.com/en/product/tempest-skirt/79499.html?dwvar_79499_color=19639", "98", "0655855e-8be7-4478-bac2-80932b4deec2"]
   ],
    "host": "0655855e-8be7-4478-bac2-80932b4deec2",
    "state": "Collecting"
}' */

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    // return User.fromJson(jsonDecode(response.body)['data'][0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to post session');
  }
}
