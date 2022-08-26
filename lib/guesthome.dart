import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womenbra/login.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'problems.dart';
import 'bra_calculator.dart';
import 'bodytype.dart';
import 'brafit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'feedback.dart';
import 'package:womenbra/feedback.dart';
class Guest extends StatefulWidget {

  const Guest({Key? key}) : super(key: key);

  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {

  @override
  void initState() {

    super.initState();
  }

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
        return Container(
          padding: EdgeInsets.only(
              top: 0, left: 30, bottom: 10, right: 30),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffff5d8f),
                  Color(0xffff87ab),
                  Color(0xfffffa6c1)
                ]
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              foregroundColor: Theme
                  .of(context)
                  .primaryColor,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10)
                , child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Problem_mapping()));
                        }, child: Text("Problem mapping",
                          style: TextStyle(
                            fontSize: 22,

                          ),
                        ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .resolveWith((states) =>
                              Colors.black87)
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(12),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Brafit_problems()));
                        }, child: Text("Bra fit problems",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .resolveWith((states) =>
                              Colors.black87)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        // padding: EdgeInsets.all(30),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  Bra_size_calculator()));
                        }, child: Text("Bra Sizing",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .resolveWith((states) =>
                              Colors.black87)
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Body_type()));
                        }, child: Text("Best Suitable bra",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .resolveWith((states) =>
                              Colors.black87)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  SizedBox(
                    width: 150,
                    height: 70,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Feedback1(user: null,)));
                    },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Feedback",
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
                        backgroundColor: MaterialStateProperty.resolveWith((
                            states) => Colors.black),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                          ),
                        ),
                      ),
                    ),
                  ),

                  Image(image: AssetImage('images/profile.png'),
                    height: 250,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),

                ],
              ),
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
}
);

  }
}
