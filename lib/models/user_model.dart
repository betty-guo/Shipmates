import 'package:flutter/foundation.dart';

class User {
  final String address;
  final String name;
  final int rating;
  final String phoneNumber;
  final String id;
  final String pfp;
  final String email;

  User(
      {@required this.address,
      @required this.name,
      @required this.rating,
      @required this.phoneNumber,
      @required this.id,
      @required this.pfp,
      @required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      address: json['address'],
      name: json['name'],
      rating: json['rating'],
      phoneNumber: json['phone_number'],
      id: json['id'],
      pfp: json['pfp'],
      email: json['email'],
    );
  }
}
