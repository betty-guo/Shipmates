import 'package:flutter/material.dart';
import 'components/sessionCard.dart';
import 'destination.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search sessions'),
      ),
      body: ListView (
        children: <Widget> [
          Container (
            margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text(
                'Looking for something in particular?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            alignment: Alignment.center,
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'Search for something!',
              ),

            ),
          ),
          Container (
            margin: EdgeInsets.fromLTRB(20, 15, 0, 10),
            child: Text(
                'Ships near you',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Container(
            width: 500,
            height: 234,
            child: SessionCard(),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          ),
          Container(
            width: 500,
            height: 234,
            child: SessionCard(),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          ),
        ]
      )
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
