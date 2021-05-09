import 'package:flutter/material.dart';
import 'package:tohacks2021/models/user_model.dart';
import 'destination.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key key, this.destination, this.user})
      : super(key: key);

  final Destination destination;
  final Future<User> user;

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState(user: user);
}

class _ProfilePageViewState extends State<ProfilePageView> {
  _ProfilePageViewState({this.user});
  Future<User> user;
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['Name', 'Email', 'Address', 'Rating'];

    Widget _buildList(User user) {
      final List<String> userFields = <String>[
        user.name,
        user.email,
        user.address,
        user.rating.toString()
      ];
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(entries[index]),
              subtitle: Text(userFields[index]),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: FutureBuilder<User>(
            future: user, // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[_buildList(snapshot.data)];
              } else {
                children = <Widget>[Container()];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              );
            }));
  }
}
