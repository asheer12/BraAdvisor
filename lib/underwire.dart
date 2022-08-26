import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Underwire extends StatefulWidget {
  const Underwire({Key? key}) : super(key: key);

  @override
  _UnderwireState createState() => _UnderwireState();
}

class _UnderwireState extends State<Underwire> {
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
          Text("Uncomfortable underwire",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/underwire.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("The underwire is sewn into the cups of a bra and is designed to provide support to your bust. It should sit comfortably under and to the sides of your bust.\nHere are a few steps we recommend you to check:\nIf the underwire feels too tight, is digging into your skin or restricting your movement, then you should go up a band size.\nIf you feel that underwire is too loose or ‘floating’ then you should go for a smaller band size.\nIf the underwire is sitting comfortable under your bust, then you’re wearing the right size.\n",
              style: GoogleFonts.barlow(
                  fontSize: 18
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/picture2.jpg'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
