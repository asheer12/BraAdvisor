import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Cup_contact extends StatefulWidget {
  const Cup_contact({Key? key}) : super(key: key);

  @override
  _Cup_contactState createState() => _Cup_contactState();
}

class _Cup_contactState extends State<Cup_contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
      ),
      body:SingleChildScrollView(child: Column(
        children: <Widget>[
          Text("Cup Contact",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/cup.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("The cups of the bra hold and support your bust. They may or may not have an underwire sewn into them always, so you can pick them basis your requirement. Cups on a well fitted bra will cover and contain all your bust tissues without feeling cramped.\nHere are a few steps we recommend you to check:\nIf there’s space between your bust tissue and the cup, it’s too big for you and you should go down a cup size.\nIf you find that your bust is spilling over the top or sides of the cups, then you should go up a cup size.\nIf the cups and underwire sit well on your body, then it’s the right size for you.\n",
              style: GoogleFonts.barlow(
                  fontSize: 18
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/picture3.jpg'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
