import 'package:flutter/material.dart';
import '../destination.dart';

class JoinedSessionCard extends StatefulWidget {
  @override
  _JoinedSessionCardState createState() => _JoinedSessionCardState();
}

class _JoinedSessionCardState extends State<JoinedSessionCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
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
