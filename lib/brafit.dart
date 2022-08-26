import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bra_calculator.dart';
import 'slipping_straps.dart';
import 'underwire.dart';
import 'cup_contact.dart';
import 'bad_bands.dart';
class Brafit_problems extends StatefulWidget {
  static List<bool> select=List.generate(4, (index) => false);
  const Brafit_problems({Key? key}) : super(key: key);

  @override
  _Brafit_problemsState createState() => _Brafit_problemsState();
}
List<Widget> screens=[
  Slipping_straps(),
  Underwire(),
  Cup_contact(),
  Bad_bands(),
];
List<AssetImage> images=[
  AssetImage('images/strapbtn.jpg'),
  AssetImage('images/underwirebtn.jpg'),
  AssetImage('images/cupbtn.jpg'),
  AssetImage('images/badbandbtn.jpg'),

];
List<String> problems=["Slipping Straps","Uncomfortable underwire","Cup contact","Bad bands"];
List<String> selected_problems=[];
class _Brafit_problemsState extends State<Brafit_problems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
      ),
      body:Column(
        children: <Widget>[
          Text("Select your Bra fit problems",
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
                    height: 40,
                  );
                },
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index) {
                  return SizedBox(
                    height: 100,
                    width: 20,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index]));
                    }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          SizedBox(width: 10,),
                          Text(problems[index],
                            style: GoogleFonts.barlow(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: images[index],
                          ),
                        ]
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
