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
        body: SessionCard()
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
