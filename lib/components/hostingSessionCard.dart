import 'package:flutter/material.dart';
import '../destination.dart';

class HostingSessionCard extends StatefulWidget {
  @override
  _HostingSessionCardState createState() => _HostingSessionCardState();
}

class _HostingSessionCardState extends State<HostingSessionCard> {
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
                        Text('Current Shipping Price:'),
                        Text('Store:'),
                        Text('Items:'),
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
