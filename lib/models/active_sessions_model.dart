import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActiveSessions {
  final String id;
  final String url;
  final int deadline;
  final String current_shipping_price;
  final String current_cart_price;
  final int num_people;
  final int max_people;
  final String host;
  final String state;

  ActiveSessions({
    @required this.id,
    @required this.url,
    @required this.deadline,
    @required this.current_shipping_price,
    @required this.current_cart_price,
    @required this.num_people,
    @required this.max_people,
    @required this.host,
    @required this.state,
  });

  factory ActiveSessions.fromJson(Map<String, dynamic> json) {
    return ActiveSessions(
      id: json['id'],
      url: json['url'],
      deadline: json['deadline'],
      current_shipping_price: json['current_shipping_price'],
      current_cart_price: json['current_cart_price'],
      num_people: json['num_people'],
      max_people: json['max_people'],
      host: json['host'],
      state: json['state'],
    );
  }
}
