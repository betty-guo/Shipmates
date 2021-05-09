import 'package:flutter/material.dart';
import 'package:tohacks2021/user_ids.dart';
import '../models/active_sessions_model.dart';
import '../destination.dart';

class SessionCard extends StatefulWidget {
  final ActiveSessions activeSession;
  SessionCard({this.activeSession});

  @override
  _SessionCardState createState() =>
      _SessionCardState(activeSession: activeSession);
}

class _SessionCardState extends State<SessionCard> {
  final ActiveSessions activeSession;
  _SessionCardState({this.activeSession});

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
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Shop'),
                  subtitle: Text(activeSession.url),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Shipmates Leader'),
                  subtitle: Text(idToEmail[activeSession.host]),
                  trailing: Icon(Icons.arrow_forward_ios, size: 50),
                ),
                Stack(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Contributed Money'),
                    subtitle: Text(activeSession.current_cart_price),
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
                              child: const Text('Join',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 400,
                                          child: Center(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                TextField(
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText:
                                                        'Add urls to your items',
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .lightGreen, // background
                                                    onPrimary: Colors
                                                        .white, // foreground
                                                  ),
                                                  child: const Text(
                                                      "Add items and join"),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  // ADD API CALL HERE
                                                ),
                                              ])));
                                    });
                              }),
                        ),
                      ],
                    ),
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
