import 'package:flutter/material.dart';
import 'package:tohacks2021/db/get_active_sessions.dart';
import 'package:tohacks2021/db/get_user.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tohacks2021/models/user_model.dart';
import 'home_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shipmates"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/logo.jpeg')),
              ),
            ),
            FormBuilder(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter valid email id as abc@gmail.com'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //TODO FORGOT PASSWORD SCREEN GOES HERE
                      },
                      child: Text(
                        'Forgot Password',
                        style:
                            TextStyle(color: Colors.lightGreen, fontSize: 15),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          getSessionByHost(
                              'ae76c66a-dd61-4246-a4cb-a008cfa412cb');
                          Future<User> user;
                          if (_formKey.currentState.fields['email'].value ==
                              "shihan@gmail.com") {
                            user = getUserById(
                                'ae76c66a-dd61-4246-a4cb-a008cfa412cb');
                          } else if (_formKey
                                  .currentState.fields['email'].value ==
                              "rahma@gmail.com") {
                            user = getUserById(
                                '0655855e-8be7-4478-bac2-80932b4deec2');
                          } else if (_formKey
                                  .currentState.fields['email'].value ==
                              "betty@gmail.com") {
                            user = getUserById(
                                '99c7d280-56be-4d97-ba3c-23ff0e6f7e1b');
                          } else if (_formKey
                                  .currentState.fields['email'].value ==
                              "eric@gmail.com") {
                            user = getUserById(
                                '1a018dcf-fdfc-4c75-b3fe-42c1b0656f73');
                          } else {
                            user = getUserById(
                                '0655855e-8be7-4478-bac2-80932b4deec2');
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Home(user: user)));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                    ),
                    Text('New User? Create Account'),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
