import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Back_pain extends StatefulWidget {
  const Back_pain({Key? key}) : super(key: key);

  @override
  _Back_painState createState() => _Back_painState();
}

class _Back_painState extends State<Back_pain> {
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
          Text("Back pain",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/backpain.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child:Text("""While research on the correlation between ill-fitting bras and back pain is often inconclusive or conflicting, there are some studies suggesting a link.\nMoreover, a large percentage of women wear the wrong size bra,especially women with larger breasts.\nResearch is clear that bigger breasts cause back pain— or at the very least, exacerbates existing pain.\nImproper breast support may directly or indirectly contribute to back pain.\nEither way, try to prioritize finding the right size bra. The volume of your bra cup should correspond with the volume of your breasts.\nEnsure your bra fits correctly by having a professional fit you for it.\nA well-fitted bra may be a good option if back pain is persistent.""",

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
