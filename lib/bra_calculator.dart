import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bodytype.dart';
import 'size_result.dart';
class Bra_size_calculator extends StatefulWidget {
  const Bra_size_calculator({Key? key}) : super(key: key);

  @override
  _Bra_size_calculatorState createState() => _Bra_size_calculatorState();
}

class _Bra_size_calculatorState extends State<Bra_size_calculator> {
  final cup_controller=TextEditingController();
  final band_controller=TextEditingController();
  String bra_size="";
  String calculate(){
    int band_size=int.parse(band_controller.text);
    int cup_size=int.parse(cup_controller.text);
    if(band_size%2!=0) {
      band_size=band_size+1;
      cup_size=cup_size+1;
    }
    else {
      band_size=band_size;
      cup_size=cup_size;
    }
    cup_size=cup_size-band_size;
    if(cup_size==1){
      bra_size="$band_size A";
    }
    else if(cup_size==2){
      bra_size="$band_size B";
    }
    else if(cup_size==3){
      bra_size="$band_size C";
    }
    else if(cup_size==4){
      bra_size="$band_size D";
    }
    else if(cup_size==5){
      bra_size="$band_size E OR DD";
    }
    else if(cup_size==6){
      bra_size="$band_size F OR DDD";
    }
    else if(cup_size==7){
      bra_size="$band_size G OR DDDD";
    }
   return bra_size;
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
      ),
      body:SingleChildScrollView(child: Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Padding(
           padding:EdgeInsets.all(30),
          child:Container(
          padding: EdgeInsets.all(15),
            height: 300,
            width: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end:Alignment.bottomCenter,
                  colors: [Color(0xffffc6ff),Color(0xffbdb2ff),Color(0xffa0c4ff)]

              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Bra size Calculator",
                style: GoogleFonts.barlow(
                  fontSize: 25,
                ),
                ),
                Text("You will need to",
                  style: GoogleFonts.barlow(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/bra.png',
                      ),
                      backgroundColor: Colors.black87,
                      radius: 45,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/mirror.png'),
backgroundColor: Colors.black87,
                      radius: 45,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/tape_icon.png'),
                      backgroundColor: Colors.black87,
                      radius: 45,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Wear a\nnon-padded\nbra"),
                    Text("Stand\nin front\nof mirror"),
                    Text("Grab a\nmeasuring\ntape"),
                  ],
                ),
              ],
            ),
          ),
         ),

          Padding(padding: EdgeInsets.all(30),
          child:Container(
            height: 300,
            width: 350,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: band_controller,
                  decoration: InputDecoration(
                    hintText: 'inches',
                    label:Text("Enter your band size")
                  ),
                ),
                TextButton(onPressed: (){
                 AlertDialog alert=AlertDialog(
                   title: Text("Calculating band size (Steps)"),
                   content: Container(
                     height: 380,
                     width: 380,
                     child:Column(
                     children: <Widget>[
                       Image(image: AssetImage('images/band.jpeg'),
                       height: 150,
                         width: 150,
                       ),
                       Text("Step-1: Wrap  the tape loosely under the bust\nLike shown in picture\nStep-2: Round the number to next whole number\nStep-3: Make a note of final number")
                     ],
                   ),
                   ),
                 );
                 showDialog(context: context, builder: (BuildContext context){
              return alert;
                 });
                }, child: Text("How to calculate band size"),
                ),
                TextFormField(
                  controller: cup_controller,
                  decoration: InputDecoration(
                      hintText: 'inches',
                      label:Text("Enter your cup size")
                  ),
                ),
                TextButton(onPressed: (){
                  AlertDialog alert=AlertDialog(
                    title: Text("Calculating Cup size (Steps)"),
                    content: Container(
                      height: 380,
                      width: 380,
                      child:Column(
                        children: <Widget>[
                          Image(image: AssetImage('images/cup.jpeg'),
                            height: 150,
                            width: 150,
                          ),
                          Text("Step-1: Wrap the tape around the fullest part of your bust\nStep-2: Make sure it’s not too tight or too loose and without any falls or twists.\nStep-3: Round off the number to the nearest whole number.")
                        ],
                      ),
                    ),
                  );
                  showDialog(context: context, builder: (BuildContext context){
                    return alert;
                  });
                }, child: Text("How to calculate Cup/bust size"),
                ),
            SizedBox(
              width: 300,
              height: 60,
               child: ElevatedButton(onPressed: () async{
                 String result;
                 result=await calculate();
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Size_result(results: result,)));
                },
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Calculate",
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                      Icon(FontAwesomeIcons.arrowRight),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70)
                      ),
                    ),
                  ),
                ),
            ),
              ],
            ),
          ),
          ),
        ],
      ),
      ),
    );

  }
}
