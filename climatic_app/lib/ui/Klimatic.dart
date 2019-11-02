import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../util/utils.dart' as util;//first we need tohet out from ui then insert into util. Hence there is 2 dots

class Klimatic extends StatefulWidget {

  Klimatic({Key key}) : super(key: key);
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  //String city="dhaka";

  void ShowData() async{
    //Map data = await getCity();
    //print(data.toString());
  }
  //String str= ['Dhaka', 'Islamabad', 'London', 'Mumbai','Auckland'] as String;
  String dropdownValue = 'Dhaka';
  @override
  Widget build(BuildContext context) {



    return new Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon:new Icon(Icons.menu,color: Colors.white) ,
              onPressed: ShowData )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          Center(
            child: new Image.asset("images/umbrella.png",width: 490,height: 1200,fit: BoxFit.fill,),
          ),
          new Container(
            alignment:Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0, 20, 30, 0),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward,color: Colors.white,),
              iconSize: 24,
              elevation: 86,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Dhaka', 'Islamabad', 'London', 'Mumbai','Auckland','Gazipur','Chittagong','Comilla','Rajshahi','Sydney','Banglore',
              'Bangkok','Paris','Dubai','Singapore','New York','Tokyo']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold,fontSize: 30),),
                );
              }).toList(),
            ),
          ),
          new Container(
            alignment:Alignment.center,
            child: Image.asset("images/light_rain.png"),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(50, 350, 0, 0),
            child: UpdateTemp(dropdownValue),
          )
        ],
      ),

    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl ="https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId&units=metric";
    //String CityNames="https://raw.githubusercontent.com/lutangar/cities.json/master/cities.json";
    //String cityNames="https://jsonplaceholder.typicode.com/comments";

    http.Response response = await http.get(apiUrl);
    //http.Response response2 = await http.get(cityNames);
    //debugPrint(response2.body);
    //debugPrint(json.decode(response2.body));

    //return JSON.decode(response.body);
    return json.decode(response.body);
  }

  Future<Map> getCity() async {

    String cityNames="https://raw.githubusercontent.com/iqbalnafee/Flutter-Apps/master/climatic_app/cityNamesFormatted.json";
    http.Response response = await http.get(cityNames);
    return json.decode(response.body);
  }

  Widget UpdateTemp(String city){
    return new FutureBuilder(
        future: getWeather(util.apiId, city),
        builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
          if(snapshot.hasData){
            Map content = snapshot.data;
            return new Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text("${content["main"]["temp"].toString()}°C",style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold,
                        color: Colors.white),),
                  )
                ],
              ),
            );
          }else{
            return new Container();
          }

        });
  }

  TextStyle cityStyle(){
    return new TextStyle(
        color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold
    );
  }
}
