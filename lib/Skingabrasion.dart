import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Skin extends StatefulWidget {
  const Skin({Key? key}) : super(key: key);

  @override
  _SkinState createState() => _SkinState();
}

class _SkinState extends State<Skin> {
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
          Text("Skin Abrasions and chafing",
            style: GoogleFonts.barlow(
              fontSize: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/chafing.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("A bra that is too tight can easily cause skin abrasions and chafing from the constant rubbing against your skin. You may see red lines anywhere the bra falls, including your overbust, underbust, back, or shoulders.Besides correcting your bra size, you may also find that using a strap extender or finding a different bra material or texture helps. For sports bras, chafing may be widespread and require you to find a different style bra.",
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
