import 'package:flutter/material.dart';
import 'package:tohacks2021/db/get_active_sessions.dart';
import 'package:tohacks2021/models/active_sessions_model.dart';
import 'components/hostingSessionCard.dart';
import 'components/joinedSessionCard.dart';
import 'destination.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Future<List<ActiveSessions>> hostSessionList;
  Future<List<ActiveSessions>> joinedSessionList;
  @override
  void initState() {
    super.initState();
    hostSessionList = getSessionByHost('0655855e-8be7-4478-bac2-80932b4deec2');
    joinedSessionList =
        getSessionByContributorId('0655855e-8be7-4478-bac2-80932b4deec2');
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
            FutureBuilder<List<ActiveSessions>>(
              future: hostSessionList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ActiveSessions>> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  List<ActiveSessions> newHostSessionList = snapshot.data;
                  children = <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Text('Looking for something in particular?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search for something!',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 15, 0, 10),
                      child: Text('Ships near you',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    Container(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newHostSessionList.length,
                        itemBuilder: (context, index) {
                          //newSessionlist[index]
                          return Container(
                            width: 500,
                            height: 162,
                            child: HostingSessionCard(
                                activeSession: newHostSessionList[index]),
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          );
                        },
                      ),
                    ),
                  ];
                } else {
                  children = <Widget>[Container()];
                }
                return ListView(
                  children: children,
                );
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text('Ships you are joining',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            FutureBuilder<List<ActiveSessions>>(
              future: joinedSessionList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ActiveSessions>> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  List<ActiveSessions> newJoinedSessionList = snapshot.data;
                  children = <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Text('Looking for something in particular?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search for something!',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 15, 0, 10),
                      child: Text('Ships near you',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    Container(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newJoinedSessionList.length,
                        itemBuilder: (context, index) {
                          //newSessionlist[index]
                          return Container(
                            width: 500,
                            height: 162,
                            child: JoinedSessionCard(
                                activeSession: newJoinedSessionList[index]),
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          );
                        },
                      ),
                    ),
                  ];
                } else {
                  children = <Widget>[Container()];
                }
                return ListView(
                  children: children,
                );
              },
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
