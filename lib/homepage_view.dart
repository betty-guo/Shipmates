import 'package:flutter/material.dart';
import 'components/hostingSessionCard.dart';
import 'components/joinedSessionCard.dart';
import 'components/newSessionsCard.dart';
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
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text('Ships you are hosting',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            Container(
              width: 500,
              height: 162,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: HostingSessionCard(),
            ),
            Container(
              width: 500,
              height: 162,
              child: HostingSessionCard(),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            ),
            Container(
              width: 500,
              height: 162,
              child: HostingSessionCard(),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            ),
            Container(
              width: 500,
              height: 162,
              child: HostingSessionCard(),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            ),
            Container(
              width: 500,
              height: 162,
              child: HostingSessionCard(),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            ),
            Container(
              width: 500,
              height: 162,
              child: HostingSessionCard(),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text('Ships you are joining',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            Container(
              width: 500,
              height: 162,
              child: JoinedSessionCard(),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            ),
            Container(
              width: 500,
              height: 162,
              child: JoinedSessionCard(),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
