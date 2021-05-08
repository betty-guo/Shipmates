import 'package:flutter/material.dart';
import '../destination.dart';

class SessionCard extends StatefulWidget {
  @override
  _SessionCardState createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body:
          Container(
            padding: EdgeInsets.all(5),
            child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        print('Card tapped.');
      }, child:
            Card(
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Shop'),
                    subtitle: Text('www.amazon.com'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('PostShare Leader'),
                    subtitle: Text('Eric Chen'),
                    trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 50
                    ),
                  ),
                  Stack (
                    children: <Widget> [
                      ListTile(
                        leading: Icon(
                            Icons.attach_money
                        ),
                        title: Text('Contributed Money'),
                        subtitle: Text('\$' + '257.50'),
                      ),
                      Positioned(
                        top: 10,
                        left: 325,
                        child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: (EdgeInsets.fromLTRB(0, 0, 10, 10)),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              child: const Text(
                                  'Shipped',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )
                              ),
                              onPressed: () {/* ... */},
                            ),
                          ),
                        ],
                      ),
                      ),
                    ]
                  ),

                ],
              ),
            ),
            ),
          ),
    );
  }
}