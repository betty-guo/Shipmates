import 'package:flutter/material.dart';
import 'package:tohacks2021/models/user_model.dart';
import 'destination.dart';
import './homepage_view.dart';
import './searchpage_view.dart';
import './hostpage_view.dart';
import './profilepage_view.dart';

class Home extends StatefulWidget {
  Home({Key key, this.user}) : super(key: key);

  final Future<User> user;

  @override
  State<StatefulWidget> createState() {
    user.then((data) {
      print("Inside state" + data.name);
    }, onError: (e) {
      print(e);
    });
    return _HomeState(user: user);
  }
}

class _HomeState extends State<Home> {
  _HomeState({this.user}) {
    this.allDestinations = <Destination>[
      Destination('Home', Icons.home, HomePageView()),
      Destination('Browse', Icons.search, SearchPageView()),
      Destination('Host', Icons.add, HostPageView(user: this.user)),
      Destination('Profile', Icons.person, ProfilePageView(user: this.user))
    ];
  }

  Future<User> user;
  int _currentIndex = 0;
  List<Destination> allDestinations;

  @override
  Widget build(BuildContext context) {
    user.then((data) {
      print("Inside home build" + data.name);
    }, onError: (e) {
      print(e);
    });

    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return destination.widget;
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        fixedColor: Color(0xFF1E425E),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon), label: destination.title);
        }).toList(),
      ),
    );
  }
}
