import 'package:flutter/material.dart';
import 'package:tohacks2021/db/get_active_sessions.dart';
import 'package:tohacks2021/models/active_sessions_model.dart';
import 'components/sessionCard.dart';
import 'destination.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  Future<List<ActiveSessions>> sessionList;

  @override
  void initState() {
    super.initState();
    sessionList = getAllSessions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search sessions'),
      ),
      body: FutureBuilder<List<ActiveSessions>>(
        future: sessionList,
        builder: (BuildContext context,
            AsyncSnapshot<List<ActiveSessions>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            List<ActiveSessions> newSessionList = snapshot.data;
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
                  shrinkWrap: true,
                  itemCount: newSessionList.length,
                  itemBuilder: (context, index) {
                    //newSessionlist[index]
                    return Container(
                      width: 500,
                      height: 234,
                      child: SessionCard(),
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    );
                  },
                ),
              ),
            ];
          } else {
            children = <Widget>[Container()];
          }
          return Center(
            child: ListView(
              children: children,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
