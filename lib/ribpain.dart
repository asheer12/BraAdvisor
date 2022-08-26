import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Rib_pain extends StatefulWidget {
  const Rib_pain({Key? key}) : super(key: key);

  @override
  _Rib_painState createState() => _Rib_painState();
}

class _Rib_painState extends State<Rib_pain> {
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
          Text("Rib Cage pain",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/ribcage.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text("Bras sit right on top of your rib cage. When you’re wearing one that is too tight, it can feel constricting and may even contribute to pain. You are also likely to see skin abrasions and chafing.\nUnderwire bras are typically the number one culprit for pain associated with the rib cage. While no research seems to suggest that this will cause any actual damage to the area, if you’re experiencing discomfort it may be worth it to look into other styles of bras." ,
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
