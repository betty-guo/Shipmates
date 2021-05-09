import 'package:flutter/material.dart';
import 'package:tohacks2021/db/notifications.dart';
import 'package:tohacks2021/models/active_sessions_model.dart';
import '../destination.dart';

class HostingSessionCard extends StatefulWidget {
  final ActiveSessions activeSession;
  HostingSessionCard({this.activeSession});

  @override
  _HostingSessionCardState createState() =>
      _HostingSessionCardState(activeSession: activeSession);
}

class _HostingSessionCardState extends State<HostingSessionCard> {
  String status = 'Processing';
  final ActiveSessions activeSession;
  _HostingSessionCardState({this.activeSession});
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
                        Text('Current Shipping Price:' +
                            activeSession.current_shipping_price),
                        Text('Store: ' + activeSession.url),
                        Text('Status: ' + activeSession.state),
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
                  title: Text('Current Shipping Price'),
                  subtitle: Text('\$' + '257.50'),
                ),
                Stack(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Status'),
                    subtitle: Text(status),
                  ),
                  Positioned(
                      top: 10,
                      left: 300,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                margin: (EdgeInsets.fromLTRB(0, 0, 10, 10)),
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      postNotification('Rahma');
                                      setState(() => this.status = 'Ordered');
                                    },
                                    child: const Text('Update',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ))))
                          ]))
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
