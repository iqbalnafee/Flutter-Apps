

import 'package:flutter/material.dart';
import 'package:mass_on_planet_x/ui/CustomMOPX.dart';

void main() => runApp(new MassOnPlanetX());

class MassOnPlanetX extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
     home: new Scaffold(
       appBar: AppBar(
         title: new Text("Mass On Planet X"),
         centerTitle: true,
       ),
       body:
       new CustomMOPX(),
       backgroundColor: Colors.tealAccent,
     ),
    );
  }
}

