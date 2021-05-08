import 'package:flutter/material.dart';
import 'destination.dart';

class HostPageView extends StatefulWidget {
  const HostPageView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _HostPageViewState createState() => _HostPageViewState();
}

class _HostPageViewState extends State<HostPageView> {
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
        title: Text('Host a new session'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
