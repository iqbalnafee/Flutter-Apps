import 'package:flutter/material.dart';

class CustomMOPX extends StatefulWidget {
  @override
  _CustomMOPXState createState() => _CustomMOPXState();
}

class _CustomMOPXState extends State<CustomMOPX> {
  final TextEditingController massController=new TextEditingController();
  final formKey = GlobalKey<FormState>();
  int radioVal=-1;
  double result=0;
  String strPlanet="enter Your mass on earth";
  void handleRadioValue(int value)
  {
    setState(() {
      radioVal=value;
      switch(radioVal)
      {
        case 0:result=calcWeight(massController.text,0.06);strPlanet="Your weight in pluto is $result";break;
        case 1:result=calcWeight(massController.text,0.38);strPlanet="Your weight in pluto is $result";break;
        case 2:result=calcWeight(massController.text,0.91);strPlanet="Your weight in pluto is $result";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(child: Image.asset("images/planet.png",height: 100,width: 100,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: massController,
              decoration: InputDecoration(hintText: "in pounds",labelText: "Enter Your Mass",border: UnderlineInputBorder(borderRadius: BorderRadius.circular(3),),
                icon: Image.asset("images/iconp.png",height: 25,width: 25,),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Radio<int>(value: 0, groupValue: radioVal, onChanged:handleRadioValue,activeColor: Colors.red,),
              ),
              new Text("Pluto",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
              new Radio<int>(value: 1, groupValue: radioVal, onChanged: handleRadioValue,activeColor: Colors.deepPurple),
              new Text("Mars",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
              new Radio<int>(value: 2, groupValue: radioVal, onChanged: handleRadioValue,activeColor: Colors.orange),
              new Text("Venus",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
            ],
          ),
         Padding(
          padding: const EdgeInsets.all(15.6),
          child: new Text(strPlanet,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 30),)
          )

        ],
      )
    );
  }

  double calcWeight(String text, double d) {
    return double.parse(text)*d;
  }
}
