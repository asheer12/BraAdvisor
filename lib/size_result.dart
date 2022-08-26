import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class Size_result extends StatefulWidget {
 String results;
 Size_result({required this.results});
  @override
  _Size_resultState createState() => _Size_resultState();
}

class _Size_resultState extends State<Size_result> {
  String size="";
  @override
  void initState(){
    super.initState();
    size=widget.results;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(60),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your size is $size",
          style: GoogleFonts.barlow(
            fontSize: 40,
          ),
          ),
        ],
      ),
      ),
    );
  }
}
