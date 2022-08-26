import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womenbra/login.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'problems.dart';
import 'maintabs.dart';
void main() {
  runApp(const Bra());
}

class Bra extends StatelessWidget {

  const Bra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        primaryColorDark:Color(0xffF4F5F9),
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor:Color(0xff16171C),
        primaryColorDark: Color(0xff0D0E10) ,
      ),

      title: "Bra Guide",
      home: Bra_types(),
    );
  }
}
class Bra_types extends StatefulWidget {
  const Bra_types({Key? key}) : super(key: key);


  @override
  _Bra_typesState createState() => _Bra_typesState();
}
enum types{
everyday,
  sports,
  special,
}
class _Bra_typesState extends State<Bra_types> {
types? select;
Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
        future: _initializeFirebase(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    return WillPopScope(
        onWillPop: () async => false,
      child: Container(
    padding: EdgeInsets.only(top: 0,left: 30,bottom: 10,right: 30),
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffff5d8f), Color(0xffff87ab),Color(0xfffffa6c1)]
    ),
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    // padding: EdgeInsets.only(right: 50),
    //      child:
    Image(image: AssetImage('images/default.png'),

    ),
    SizedBox(
    width: 300,
    height: 60,
    child:ElevatedButton(onPressed: (){
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Tabs(user: FirebaseAuth.instance.currentUser)));
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    }
    },

    child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text("Get Started",
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
    );
    }
      else{
     return Scaffold(
        body:Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            Text("Firebase Not connected"),
            CircularProgressIndicator(),
          ],
        ),
      );
      }
    },
    );
  }
}
