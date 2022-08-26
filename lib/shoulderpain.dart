import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Shoulder_pain extends StatefulWidget {
  const Shoulder_pain({Key? key}) : super(key: key);

  @override
  _Shoulder_painState createState() => _Shoulder_painState();
}

class _Shoulder_painState extends State<Shoulder_pain> {
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
          Text("Shoulder pain",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/shoulderpain.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("Shoulder and Neck PainWomen with larger breasts may also experience shoulder and neck pain.\nBras designed for larger breasts often come with larger straps in order to disperse weight and provide more support. These wide straps, however, can cause shoulder pain which can then contribute to neck pain as well.Sometimes even a properly fitted bra can’t fix shoulder and neck pain though — or other pains for that matter. If you’ve been fitted for a bra, but still experience these symptoms, it may be time to talk to your doctor.\nResearch shows that breast reduction improves symptoms of macromastia. You may be a good candidate for breast reduction surgery if you are at a healthy weight, but are otherwise experiencing adverse symptoms such as shoulder and neck pain, back pain, or breast pain.",
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
