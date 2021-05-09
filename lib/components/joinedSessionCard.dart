import 'package:flutter/material.dart';
import 'package:tohacks2021/user_ids.dart';
import '../models/active_sessions_model.dart';
import '../destination.dart';

class JoinedSessionCard extends StatefulWidget {
  final ActiveSessions activeSession;
  JoinedSessionCard({this.activeSession});

  @override
  _JoinedSessionCardState createState() =>
      _JoinedSessionCardState(activeSession: activeSession);
}

class _JoinedSessionCardState extends State<JoinedSessionCard> {
  final ActiveSessions activeSession;
  _JoinedSessionCardState({this.activeSession});
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
                        Text('Host: Betty'),
                        Text('Current Shipping Price: 100' +
                            activeSession.current_shipping_price),
                        Text('Store: Aritizia.com'),
                        Text('Status: Shipped'),
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
                  subtitle: Text('Betty'),
                ),
                Stack(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Status'),
                    subtitle: Text('Shipped'),
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
