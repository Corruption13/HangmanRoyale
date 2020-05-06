import 'package:flutter/material.dart';
import 'Game.dart';
import 'package:hangmangame/Menu.dart';



void main() => runApp(MaterialApp(

      routes: {

        "/": (context) => Menu(),

        "/game": (context) => Game(),

      }

    ),

) ;


