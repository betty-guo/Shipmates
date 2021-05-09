import 'package:flutter/material.dart';
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
