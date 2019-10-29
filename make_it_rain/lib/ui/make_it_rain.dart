import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return  makeItRainState();
  }

}

class makeItRainState extends State<MakeItRain>{
  int _val=1000;

  void _increaseMoney()
  {

    setState(() {
      _val=_val+200;
    });
  }
  @override
  Widget build(BuildContext context) {




    return  Scaffold(
      appBar: new AppBar(
        title: new Text("Make It Rain"),
        backgroundColor: Colors.blue
      ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Center(
                child: new Text("Get Rich!!! ",
                  style: new TextStyle(
                      color: Colors.amber,
                      fontWeight:FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 30
                  ),
                ),
              ),
              new Expanded(
                  child: new Center(
                    child: new Text('\$$_val',
                      style: new TextStyle(
                          color: Colors.green,
                          fontWeight:FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 50),
                      textDirection: TextDirection.ltr,
                  ))
              ),
              new Expanded(
                  child:new Center(
                    child: new FlatButton(color:Colors.green,
                      onPressed:_increaseMoney,
                        child: new Text("Make It Rain",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w400
                          ),)
                      )
                  ) )
            ],
          ),
        )
    );
  }
}