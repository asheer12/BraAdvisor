import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'best_suitable_bra.dart';
class Body_type extends StatefulWidget {
  static List<bool> select=List.generate(8, (index) => false);
  const Body_type({Key? key}) : super(key: key);

  @override
  _Body_typeState createState() => _Body_typeState();
}
enum types{
  round,
  asymmetrical,
  closed,
wide,
teardrop,
relaxed,
petite,
conical
}
class _Body_typeState extends State<Body_type> {
types? select;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Select your Body type",
            style: TextStyle(
              fontSize: 30,
            ),
          ),

     Container(
        height: 550,
      child:SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    select=types.round;
                  });
                },
             child:  Container(
               height: 160,
               width: 160,
                 margin: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                     color: select==types.round? Colors.green:Color(0xffff90b3),
                     borderRadius: BorderRadius.circular(10),
                 ),child:Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children:<Widget>[
                   Text("Rounded shape",
                  style: GoogleFonts.barlow(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                    ),
                  ),
                ),
                   CircleAvatar(
                     radius: 55,
                     backgroundImage: AssetImage('images/round.jpg',
                     ),
                   ),
               ]
             ),
             ),
                ),

              GestureDetector(
                onTap: (){
                  setState(() {
                    select=types.asymmetrical;
                  });
                },
                child:  Container(
                  height: 160,
                  width: 160,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: select==types.asymmetrical? Colors.green:Color(0xffff90b3),
                      borderRadius: BorderRadius.circular(10),
                    ),child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Text("Asymmetrical",
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('images/asymmetric.jpg'),
                      ),
                    ]
                ),
                  ),
                ),

            ],
          ),
       
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              GestureDetector(
                onTap: (){
                  setState(() {
                    select=types.closed;
                  });
                },
                child:  Container(
                  height: 160,
                  width: 160,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: select==types.closed? Colors.green:Color(0xffff90b3),
                      borderRadius: BorderRadius.circular(10),
                    ),child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Text("Closed Set",
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('images/round.jpg'),
                      ),
                    ]
                ),
                  ),
                ),

              GestureDetector(
                onTap: (){
                  setState(() {
                    select=types.wide;
                  });
                },
                child:   Container(
                  height: 160,
                  width: 160,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: select==types.wide? Colors.green:Color(0xffff90b3),
                      borderRadius: BorderRadius.circular(10),
                    ),child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Text("Wide set",
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('images/wideset.jpg'),
                      ),
                    ]
                ),
                  ),
                ),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    select=types.teardrop;
                  });
                },
                child:  Container(
                  height: 160,
                  width: 160,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: select==types.teardrop? Colors.green:Color(0xffff90b3),
                      borderRadius: BorderRadius.circular(10),
                    ),child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Text("Tear Drop",
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('images/teardrop.jpg'),
                      ),
                    ]
                ),
                  ),
                  ),


              GestureDetector(
                onTap: (){
                  setState(() {
                    select=types.relaxed;
                  });
                },
                child:   Container(
                  height: 160,
                  width: 160,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: select==types.relaxed? Colors.green:Color(0xffff90b3),
                      borderRadius: BorderRadius.circular(10),
                    ),child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Text("Relaxed",
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('images/relaxed.jpg'),
                      ),
                    ]
                ),
                  ),
                ),
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                GestureDetector(
                  onTap: (){
                    setState(() {
                      select=types.petite;
                    });
                  },
                  child:  Container(
                    height: 160,
                    width: 160,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: select==types.petite? Colors.green:Color(0xffff90b3),
                        borderRadius: BorderRadius.circular(10),
                      ),child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        Text("Petite",
                          style: GoogleFonts.barlow(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage('images/petite.jpg'),
                        ),
                      ]
                  ),
                    ),
                  ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      select=types.conical;
                    });
                  },
                  child:   Container(
                    height: 160,
                    width: 160,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: select==types.conical? Colors.green:Color(0xffff90b3),
                        borderRadius: BorderRadius.circular(10),
                      ),child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        Text("Conical",
                          style: GoogleFonts.barlow(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage('images/conical.jpg'),
                        ),
                      ]
                  ),
                    ),
                  ),
                
              ],
            ),
        ],
        ),
     ),
    ),
          SizedBox(
            width: 300,
            height: 60,
            child:ElevatedButton(onPressed: (){
              String type="";
              if(select==types.round){
                type="Rounded";
              }
              else if(select==types.asymmetrical){
                type="Asymmetrical";
              }
              else if(select==types.closed){
                type="Closed Set";
              }
              else if(select==types.wide){
                type="Wide Set";
              }
              else if(select==types.teardrop){
                type="Tear Drop";
              } else if(select==types.relaxed){
                type="Relaxed";
              } else if(select==types.petite){
                type="Petite/athletic";
              } else if(select==types.conical){
                type="Conical";
              }

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Suitable_bra(result: type,)));
            }, child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Next",
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
                backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xff6e44ff)),
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
    );
  }
}
