import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tohacks2021/db/get_user.dart';
import 'package:tohacks2021/models/user_model.dart';
import 'destination.dart';

class HostPageView extends StatefulWidget {
  const HostPageView({Key key, this.destination, this.user}) : super(key: key);

  final Destination destination;
  final Future<User> user;

  @override
  _HostPageViewState createState() {
    user.then((data) {
      print("Inside state hostpage" + data.name);
    }, onError: (e) {
      print(e);
    });
    return _HostPageViewState(user: user);
  }
}

class _HostPageViewState extends State<HostPageView> {
  _HostPageViewState({this.user});

  final _formKey = GlobalKey<FormBuilderState>();
  final _formInputDecorationFactory = FormInputDecorationFactory();
  Future<User> user;

  @override
  Widget build(BuildContext context) {
    print(context);
    print("Inside the hostpage builder");
    return Scaffold(
      appBar: AppBar(
        title: Text('Host a new session'),
      ),
      body: FutureBuilder<User>(
        future: user,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            decoration:
                                _formInputDecorationFactory.create("Full Name"),
                          ),
                          FormBuilderTextField(
                            name: 'email',
                            decoration:
                                _formInputDecorationFactory.create("Email"),
                          ),
                          FormBuilderTextField(
                            name: 'phone',
                            decoration:
                                _formInputDecorationFactory.create("Phone"),
                          ),
                          FormBuilderTextField(
                            name: 'address',
                            decoration:
                                _formInputDecorationFactory.create("Address"),
                          ),
                          FormBuilderTextField(
                            name: 'website',
                            decoration:
                                _formInputDecorationFactory.create("Website"),
                          ),
                          FormBuilderDateTimePicker(
                            name: 'deadline',
                            decoration:
                                _formInputDecorationFactory.create("Deadline"),
                          ),
                          FormBuilderTextField(
                            name: 'current_shipping_price',
                            decoration: _formInputDecorationFactory
                                .create("Current Shipping Price"),
                          ),
                          FormBuilderTextField(
                            name: 'current_cart_price',
                            decoration: _formInputDecorationFactory
                                .create("Current Cart Price"),
                          ),
                          FormBuilderTextField(
                              name: 'max_people',
                              decoration: _formInputDecorationFactory
                                  .create("Max People (Optional)")),
                          Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                                onPressed: () {
                                  final nameData = _formKey
                                      .currentState.fields['name'].value;

                                  FocusScope.of(context).unfocus();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text('$nameData',
                                              textScaleFactor: 1.5)));
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                )),
                          ),
                        ]),
                  ),
                  onChanged: () => print("Form has been changed"),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: {
                    'name': snapshot.data.name,
                    'email': snapshot.data.email,
                    'phone': snapshot.data.phoneNumber,
                    'address': snapshot.data.address,
                  }),
            ];
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
        },
      ),
    );
  }
}

class FormInputDecorationFactory {
  InputDecoration create(String text) {
    return InputDecoration(
        border: OutlineInputBorder(), labelText: text, hintText: text);
  }
}
