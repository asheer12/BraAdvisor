import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Suitable_bra extends StatefulWidget {
    final String result;
    Suitable_bra({required this.result});

  @override
  _Suitable_braState createState() => _Suitable_braState();
}


class _Suitable_braState extends State<Suitable_bra> {
  String body_type="";
  @override
  void initState(){
    body_type=widget.result;
super.initState();
  }
  Widget suggestion() {
    if(body_type=="Asymmetrical") {
      return SingleChildScrollView(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Demi Bra",
          style: GoogleFonts.barlow(
            fontSize: 40,
          ),
          ),
          CircleAvatar(
            radius: 250,
            backgroundImage: AssetImage('images/demibra1.jpg'),
          ),
          CircleAvatar(
            radius: 250,
            backgroundImage: AssetImage('images/demibra2.jpg'),
          ),
          CircleAvatar(
            radius: 250,
            backgroundImage: AssetImage('images/demibra3.jpg'),
          ),
        ],
      ),
      );
    }
    else if(body_type=="Rounded"){
      return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Plunge Bra",
              style: GoogleFonts.barlow(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/plungebra2.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/plungebra3.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/plungebra4.jpg'),
            ),
          ],
        ),
      );
    }
    else if(body_type=="Closed Set"){
      return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Plunge Bra",
              style: GoogleFonts.barlow(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/plungebra2.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/plungebra3.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/plungebra4.jpg'),
            ),
          ],
        ),
      );
    }
    else if(body_type=="Wide Set"){
      return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Wireless Bra",
              style: GoogleFonts.barlow(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/wirelessbra1.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/wirelessbra2.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/wirelessbra3.jpg'),
            ),
          ],
        ),
      );
    }
    else if(body_type=="Tear Drop"){
      return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Balconette Bra",
              style: GoogleFonts.barlow(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/balbra1.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/balbra2.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/balbra3.jpg'),
            ),
          ],
        ),
      );
    }
    else if(body_type=="Relaxed"){
      return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Full Cup Bra",
              style: GoogleFonts.barlow(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 180,
              backgroundImage: AssetImage('images/fullcupbra1.jpg'),
            ),
            CircleAvatar(
              radius: 180,
              backgroundImage: AssetImage('images/fullcupbra2.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/fullcupbra3.jpg'),
            ),
          ],
        ),
      );
    }
    else if(body_type=="Petite/athletic"){
      return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Push-up Bra",
              style: GoogleFonts.barlow(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/pushupbra1.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/pushupbra2.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/pushupbra3.jpg'),
            ),
          ],
        ),
      );
    }
    else if(body_type=="Conical"){
      return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("T-shirt Bra",
              style: GoogleFonts.barlow(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/tshirtbra1.jpg'),
            ),
            CircleAvatar(
              radius: 180,
              backgroundImage: AssetImage('images/tshirtbra2.jpg'),
            ),
            CircleAvatar(
              radius: 220,
              backgroundImage: AssetImage('images/tshirtbra3.jpg'),
            ),
          ],
        ),
      );
    }
    else{
      return Text("You have not select any type");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Theme.of(context).primaryColor,
    backgroundColor: Colors.transparent,
    ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Column(
        children: <Widget>[
          Text("Suitable bra for $body_type:",
            style: GoogleFonts.barlow(
                fontSize: 25,
            ),
          ),
          Container(
            height: 650,
            width: 400,
            padding: EdgeInsets.all(10),
            child:suggestion(),
          ),
        ],
      ),
      ),
    );
  }
}
