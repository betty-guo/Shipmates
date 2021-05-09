import 'package:flutter/material.dart';
import 'package:tohacks2021/db/get_user.dart';
import 'destination.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
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
    print("HTTP RESPONSE:");
    print(getUserById('be8b0720-922f-40f5-9d5a-0b96c3268f9e'));
    final List<String> entries = <String>['Name', 'Email', 'Address', 'Rating'];
    final Map<String, String> values = {
      'Name:': "Shi Han",
      'Email:': "sq@gmail.com",
      "Address": "96 Uni Ave",
      "Rating": "5/5"
    };

    Widget _buildList() {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(entries[index]),
              subtitle: Text('${entries[index]}'),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: _buildList());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
