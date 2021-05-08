import 'package:flutter/material.dart';
import 'destination.dart';
import 'destination_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOHacks2021'),
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return DestinationView(destination: destination);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        fixedColor: Colors.black,
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
