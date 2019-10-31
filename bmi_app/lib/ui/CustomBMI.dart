import 'package:flutter/material.dart';

class CustomBMI extends StatefulWidget {
  @override
  _CustomBMIState createState() => _CustomBMIState();
}

class _CustomBMIState extends State<CustomBMI> {
  String BMI="";
  String verdict="";
  final TextEditingController ageController=new TextEditingController();
  final TextEditingController heightController=new TextEditingController();
  final TextEditingController weightController=new TextEditingController();
  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView(
        children: <Widget>[
          Center(
            child: Image.asset("images/bmi1.png",height: 100,width: 100,),
          ),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: new TextField(controller: ageController,decoration: InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.circular(3)),
              labelText: "Age",icon: Image.asset("images/age.png",height: 40,width: 40),hintText: "Age in Years",
               errorText: _validate1 ? 'Age Can\'t Be Empty' : null,),
              keyboardType: TextInputType.number),
           ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new TextField(controller: heightController,decoration: InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.circular(3)),
                  labelText: "Height",icon: Image.asset("images/height.png",height: 40,width: 40),hintText: "Height in feet",
                errorText: _validate2 ? 'Height Can\'t Be Empty' : null,),
                  keyboardType: TextInputType.number),
            ),

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: new TextField(controller: weightController,decoration: InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.circular(3)),
                  labelText: "Weight",icon: Image.asset("images/weigh.png",height: 40,width: 40),hintText: "Weight in kg",
               errorText: _validate3 ? 'Weight Can\'t Be Empty' : null,),
                  keyboardType: TextInputType.number),
           ),

          new RaisedButton(
            onPressed:CalcBMI,
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            color: Colors.red,
            child: Text("Calculate"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(BMI,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.green),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(verdict,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.black),),
            ),
          )

        ],
      ),
    );
  }

  void CalcBMI() {

    setState(() {
      ageController.text.isEmpty ? _validate1 = true : _validate1 = false;
      heightController.text.isEmpty ? _validate2 = true : _validate2 = false;
      weightController.text.isEmpty ? _validate3 = true : _validate3 = false;
      //debugPrint("here 2");

      if(_validate1==false&&_validate2==false&&_validate3==false){
        //FocusScope.of(context).requestFocus(new FocusNode());
        debugPrint("here3");
        double a =  double.parse(ageController.text);
        double h =  double.parse(heightController.text);
        h=h*0.3048;
        double w =  double.parse(weightController.text);
        //w=w*0.453592;
        double bmi=w/(h*h);
        debugPrint(bmi.toString());
        String bmi1=bmi.toStringAsFixed(2);
        debugPrint(bmi.toStringAsFixed(2));
        BMI="Your BMI is $bmi1";
        if(bmi<=15){
          verdict = "Very severely underweight";
        }
        else if(bmi>15&&bmi<=16){
          verdict = "Severely underweight";
        }
        else if(bmi>16&&bmi<=18.5){
          verdict = "Underweight";
        }
        else if(bmi>18.5&&bmi<=25){
          verdict = "Normal(Healty Weight)";
        }
        else if(bmi>25&&bmi<=30){
          verdict = "Overweight";
        }
        else if(bmi>30&&bmi<=35){
          verdict = "Moderately obese";
        }
        else if(bmi>35&&bmi<=40){
          verdict = "severely obese";
        }
        else if(bmi>40){
          verdict = "Very severely obese";
        }
        else{
          verdict="You are finished!";
        }
      }

    });

  }
}
