import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Badposture extends StatefulWidget {
  const Badposture({Key? key}) : super(key: key);

  @override
  _BadpostureState createState() => _BadpostureState();
}

class _BadpostureState extends State<Badposture> {
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
          Text("Bad posture",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Image(image: AssetImage('images/badposture.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
              child: Text("Several of the pains mentioned — breast, back, shoulder, and neck pain — may result in bad posture. The pain can make a person hunch forward in an effort to alleviate it. Bad posture may actually exacerbate back, shoulder, or neck pain, creating a vicious cycle.",
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
