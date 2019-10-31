import 'package:flutter/material.dart';

class CustomLogIn extends StatefulWidget {
  @override
  _CustomLogInState createState() => _CustomLogInState();
}

class _CustomLogInState extends State<CustomLogIn> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: new Image.asset("images/login.png",width: 100,height: 100,),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField (
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  gapPadding: 3
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "PassWord",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),gapPadding: 3)
              ),
            ),
          ),
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: RaisedButton(color:Colors.white,onPressed: (){},
                         child:new Text("Submit") ,),


                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(color:Colors.white,onPressed: (){
                  },
                    child:new Text("Clear") ,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
