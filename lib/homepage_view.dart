import 'package:flutter/material.dart';
import 'components/sessionCard.dart';
import 'destination.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text home',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView(
          children: <Widget> [
            Container (
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text(
                  'Active Sessions',
              textAlign: TextAlign.start,
              style: TextStyle(
                 fontSize: 20,
              )),
            ),
            Container(
              width: 500,
              height: 234,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: SessionCard()
            ),
            Container(
                width: 500,
                height: 234,
                child: SessionCard(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            Container(
              width: 500,
              height: 234,
              child: SessionCard(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            Container(
              width: 500,
              height: 234,
              child: SessionCard(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            Container(
              width: 500,
              height: 234,
              child: SessionCard(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            Container(
              width: 500,
              height: 234,
              child: SessionCard(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            Container (
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text(
                  'Sessions Near You',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            Container(
              width: 500,
              height: 234,
              child: SessionCard(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            Container(
              width: 500,
              height: 234,
              child: SessionCard(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
          ],
        )
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
