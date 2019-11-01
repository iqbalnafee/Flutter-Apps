import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://jsonplaceholder.typicode.com/posts

  void main() async{

    List _data = await getJSON();
    print(_data[1]["title"]);
    for (var i = 0; i < _data.length; i++) {
      //print("Title: ${_data[i]["title"]}");
    }
    runApp( new MaterialApp(
        title: "Parsing And Update Json Data",
        home: Scaffold(
            appBar: AppBar(
              title: new Text("Parsing And Update Json Data"),
              centerTitle: true,
              backgroundColor: Colors.orange,
            ),
            body: ListView.builder(
                itemCount: _data.length ,
                padding: const EdgeInsets.all(4.4),
                itemBuilder: (BuildContext context, int  position){
                  return Column(
                    children: <Widget>[
                      Divider(height: 3.4,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            title: Text(_data[position]["title"],
                              style: TextStyle(
                                  fontSize: 17.2,
                                  fontWeight: FontWeight.bold
                              ),),
                        subtitle: Text(_data[position]["body"]),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                            child: Text(_data[position]["title"][0].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          //child: Text(_data[position]["id"].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        ),
                        onTap: () => showTapMessage(context,_data[position]["title"].toString())),
                      )

                    ],
                  );

                })
        ))
    );

}

void showTapMessage(BuildContext context, String message) {
  var alertDialog = new AlertDialog(
    title: Text(message),
    actions: <Widget>[

      FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("OK"))
    ],
  );
  showDialog(context: context, builder: (context){
    return alertDialog;
  });

}

Future<List> getJSON () async{
  String apiURL = "https://jsonplaceholder.typicode.com/posts";

  http.Response response = await http.get(apiURL);

  //debugPrint(response.body);

  return json.decode(response.body);
}