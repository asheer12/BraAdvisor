import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Discomfort extends StatefulWidget {
  const Discomfort({Key? key}) : super(key: key);

  @override
  _DiscomfortState createState() => _DiscomfortState();
}

class _DiscomfortState extends State<Discomfort> {
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
          Text("Discomfort",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/discomfort.jpeg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("Last but not least, an ill-fitted bra might simply make you feel uncomfortable and embarrassed. Your breasts could end up spilling out of your bra, causing your clothing to fit awkwardly. Bra straps may be digging into your skin contributing to pain or sliding off your shoulders, prompting you to constantly pull them back up.\nMothers may be particularly concerned about the general discomfort and embarrassment of an ill-fitted bra. While it takes time to heal after giving birth, some changes to the body are more permanent.",
              style: GoogleFonts.barlow(
                  fontSize: 18
              ),
            ),
          ),

        ],
      ),
      ),
    );
  }
}
