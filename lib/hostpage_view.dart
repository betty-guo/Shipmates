import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'destination.dart';

class HostPageView extends StatefulWidget {
  const HostPageView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _HostPageViewState createState() => _HostPageViewState();
}

class _HostPageViewState extends State<HostPageView> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formInputDecorationFactory = FormInputDecorationFactory();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Host a new session'),
        ),
        body: FormBuilder(
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
                      decoration: _formInputDecorationFactory.create("Email"),
                    ),
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: _formInputDecorationFactory.create("Phone"),
                    ),
                    FormBuilderTextField(
                      name: 'address',
                      decoration: _formInputDecorationFactory.create("Address"),
                    ),
                    FormBuilderTextField(
                      name: 'website',
                      decoration: _formInputDecorationFactory.create("Website"),
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
                            final nameData =
                                _formKey.currentState.fields['name'].value;

                            FocusScope.of(context).unfocus();

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 1),
                                content:
                                    Text('$nameData', textScaleFactor: 1.5)));
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                    ),
                  ]),
            ),
            onChanged: () => print("Form has been changed"),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: {
              'name': 'Betty Guo',
              'email': 'bettyg3113@gmail.com',
              'phone': '2269299708',
              'address': '96 University',
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class FormInputDecorationFactory {
  InputDecoration create(String text) {
    return InputDecoration(
        border: OutlineInputBorder(), labelText: text, hintText: text);
  }
}
