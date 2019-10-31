import 'package:flutter/material.dart';
import 'package:bmi_app/ui/CustomBMI.dart';
void main() => runApp(new bmi());

class bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "BMI",
      home: Scaffold(
        appBar: AppBar(
          title: new Text("BMI APP"),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: new CustomBMI(),
        backgroundColor: Colors.white,
      ),
    );
  }
}