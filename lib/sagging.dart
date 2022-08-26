import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Sagging extends StatefulWidget {
  const Sagging({Key? key}) : super(key: key);

  @override
  _SaggingState createState() => _SaggingState();
}

class _SaggingState extends State<Sagging> {
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
          Text("Premature Sagging",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/sagging.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("Bras are designed to lift up your breasts and provide support, but if you’re wearing the incorrect size, they may do exactly the opposite. One that is too big, for instance, may leave too much room for your breasts instead of providing the support they need.\nAvoid premature sagging by getting professionally fitted for a bra.",
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
