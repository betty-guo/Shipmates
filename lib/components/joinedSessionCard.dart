import 'package:flutter/material.dart';
import '../destination.dart';

class JoinedSessionCard extends StatefulWidget {
  @override
  _JoinedSessionCardState createState() => _JoinedSessionCardState();
}

class _JoinedSessionCardState extends State<JoinedSessionCard> {
  final List<String> details = <String>[
    "Host",
    "Current Shipping Price",
    "Store",
    "Status"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Session Details"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Host:'),
                        Text('Current Shipping Price:'),
                        Text('Store:'),
                        Text('Status:'),
                      ],
                    ),
                  ),
                  // actions: [
                  //   okButton,
                  // ],
                );
              },
            );
            print('Card tapped.');
          },
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Host'),
                  subtitle: Text('Eric Chen'),
                ),
                Stack(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Status'),
                    subtitle: Text('Procesing'),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
