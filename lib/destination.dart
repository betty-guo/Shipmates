import 'package:flutter/material.dart';
import './homepage_view.dart';
import './searchpage_view.dart';
import './hostpage_view.dart';
import './profilepage_view.dart';
import './components/session-card.dart';

class Destination {
  Destination(this.title, this.icon, this.widget);
  final String title;
  final IconData icon;
  final Widget widget;
}

List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, HomePageView()),
  Destination('Browse', Icons.search, SearchPageView()),
  Destination('Host', Icons.add, HostPageView()),
  Destination('Profile', Icons.person, ProfilePageView())
];
