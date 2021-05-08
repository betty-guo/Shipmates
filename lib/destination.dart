import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home),
  Destination('Browse', Icons.search),
  Destination('Host', Icons.add),
  Destination('Profile', Icons.person)
];
