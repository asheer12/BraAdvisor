import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'brafit.dart';
import 'breastpain.dart';
import 'backpain.dart';
import 'shoulderpain.dart';
import 'ribpain.dart';
import 'sagging.dart';
import 'Discomfort.dart';
import 'Badposture.dart';
import 'Skingabrasion.dart';
class Problem_mapping extends StatefulWidget {
  static List<bool> select=List.generate(8, (index) => false);
  const Problem_mapping({Key? key}) : super(key: key);

  @override
  _Problem_mappingState createState() => _Problem_mappingState();
}
class _Problem_mappingState extends State<Problem_mapping> {
  List<Widget> screens=[
    Breast_pain(),
    Back_pain(),
    Shoulder_pain(),
    Rib_pain(),
    Sagging(),
    Discomfort(),
    Badposture(),
    Skin(),
  ];
  List<AssetImage> images=[
   AssetImage('images/breastpainbtn.jpg'),
    AssetImage('images/backpainbtn.jpg'),
    AssetImage('images/shoulderpainbtn.jpg'),
    AssetImage('images/ribcagebtn.jpg'),
    AssetImage('images/saggingbtn.jpg'),
    AssetImage('images/discomfortbtn.jpeg'),
    AssetImage('images/badposturebtn.jpg'),
    AssetImage('images/skinabrasionbtn.jpg'),
  ];
  List<String> problems=["Breast pain","Back pain","Shoulder pain","Rib cage pain","Sagging","Discomfort","Bad posture","Skin abrasions"];
  List<String> selected_problems=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
          children: <Widget>[
            Text("Select your problems",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 650,
          padding: EdgeInsets.all(30),
          child: ListView.separated(
            itemCount:problems.length ,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 25,
              );
            },
            scrollDirection: Axis.vertical,
           itemBuilder: (context,index) {
          return Container(
           // padding: EdgeInsets.all(10),
              height: 100,
              width: 20,
             child: ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index]));
             }, child:Padding(
               padding: EdgeInsets.all(15),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:<Widget>[
               SizedBox(width: 10,),
               Container(
             child:
               Text(problems[index],
               style: GoogleFonts.barlow(
                 textStyle: TextStyle(
                     color: Colors.white,
                     fontSize: 20
               ),
             ),
             ),
               ),
               Container(

                 child:
               CircleAvatar(
                 radius: 35,
                 backgroundImage: images[index],
               ),
               ),
               ]
             ),
             ),
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xffff90b3)),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
             RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(70)
             ),
               ),
             ),
          ),
          );
           }
          ),
      ),

          ],
        ),
    );
  }
}
