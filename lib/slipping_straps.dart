import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Slipping_straps extends StatefulWidget {
  const Slipping_straps({Key? key}) : super(key: key);

  @override
  _Slipping_strapsState createState() => _Slipping_strapsState();
}

class _Slipping_strapsState extends State<Slipping_straps> {
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
          Text("Slipping straps",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/straps.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("You are wearing the wrong size if your bra straps keep slipping off your shoulders, or are so tight they are digging into your skin. Straps of the correct sized bra will sit comfortably on your shoulders without slipping off.Here are a few steps we recommend you to check:\n\nIf the straps start to slip off, then try a sister size with a smaller band or fasten the straps tighter.\nIf the straps are too tight and start to dig into your skin, then you may need to try a bigger band size or loosen the straps.\nIf you’re able to slide 2 fingers easily under the straps, you’re wearing the right size\n",
              style: GoogleFonts.barlow(
                  fontSize: 18
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/picture1.jpg'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
