import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("HangMan Royale",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.deepPurple,

      ),
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton.icon(
                label: Text("Single Player"),
                icon: Icon(Icons.person),
                onPressed: (){ Navigator.pushNamed(context, "/game") ;},
              ),
              RaisedButton.icon(
                label: Text("Online Play",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                icon: Icon(Icons.person, color: Colors.grey, ),
                  onPressed: (){
                    launch('https://github.com/flutter/gallery/') ;
                    print("Coming Soon!") ;
                  }


              ),

               SizedBox(height: 10),
               Text("Beta V0.3\nSandeep Pillai\ngithub.com/Corruption13",
                    style: TextStyle(color: Colors.grey),textAlign: TextAlign.center ),

            ],
          ),
        ),
      ),
    );
  }
}
