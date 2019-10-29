import 'package:flutter/material.dart';
import 'package:login_app/ui/CustomLogIn.dart';


void main() => runApp(new LogIn());

class LogIn extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:"Log In",
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("Log In"),
          centerTitle: true,
        ),
        backgroundColor: Colors.tealAccent,
        body: new CustomLogIn()
      ),
    );

  }

}


