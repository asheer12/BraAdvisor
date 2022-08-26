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
class Tabs extends StatefulWidget {
  final  User? user;
  static User? _currentUser;
  Tabs({required this.user});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  @override
  void initState() {
    Tabs._currentUser = widget.user;
    super.initState();
  }

  Future<void> _signOut() async {
    try {
      FirebaseFirestore.instance.collection('Users').doc(Tabs._currentUser?.uid).update({'active':false});
      await FirebaseAuth.instance.signOut();

    } catch (e) {
      print("exception");
      print(e); // TODO: show dialog with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user != null) {
              return WillPopScope(
                onWillPop: () async => false,
                child: Container(
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
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                    ),
                    backgroundColor: Colors.transparent,
                    resizeToAvoidBottomInset: true,
                    body: SingleChildScrollView(
                      child:Padding(
                        padding: EdgeInsets.all(10)
                        ,child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Hello,\n"+Tabs._currentUser!.displayName.toString(),
                              style: TextStyle(fontSize: 25),
                            ),
                            //SizedBox(width: 90,),
                            IconButton(onPressed: () {
                              _signOut();
                            }, icon: Icon(FontAwesomeIcons.powerOff))
                          ],
                        ),

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
                            //  padding: EdgeInsets.all(20),
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
                          child:ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedback1(user: Tabs._currentUser,)));
                          },

                            child:Row(
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
                              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                ),
              );
            }
            else {
              return Login();
            }
          }
          else {
            return Login();
          }
        }
    );
  }
}