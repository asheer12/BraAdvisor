import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
class Breast_pain extends StatefulWidget {
  const Breast_pain({Key? key}) : super(key: key);

  @override
  _Breast_painState createState() => _Breast_painState();
}

class _Breast_painState extends State<Breast_pain> {
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
            Text("Breast pain",
            style: GoogleFonts.barlow(
              fontSize: 35,
            ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Image(image: AssetImage('images/breast_pain.jpeg'),
              ),
            ),

            Container(
              padding: EdgeInsets.all(30),
            child: Text("""• One of the first things you may notice from wearing the wrong size bra is breast pain.\n• Complaints are more typical of people with larger breast cup sizes, who exercise infrequently, or who are premenopausal.\n• There are many ways in which the wrong size bra can contribute to breast pain.\n• If your bra is too small, it can dig into your breasts — if it is too big, your breasts may have too much room and can become prone to bouncing around, contributing to tenderness.\n• Lastly, if you suffer from breast asymmetry or other abnormalities, it may feel like every bra is the wrong size.\n• For this reason, you may consider congenital breast asymmetry surgery or breast augmentation.\n• Of course, there can be other causes of breast pain, including pregnancy, breastfeeding, menstruation, and exercise — so make sure to rule out other causes before determining that the pain is from your bra.""",
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
