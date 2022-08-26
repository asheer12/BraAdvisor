import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'problems.dart';
import 'maintabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
class Signip extends StatefulWidget {
  const Signip({Key? key}) : super(key: key);

  @override
  _SignipState createState() => _SignipState();
}

class _SignipState extends State<Signip> {
  final email_controller=TextEditingController();
  final pass_controller=TextEditingController();
  final name_controller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return WillPopScope(
                onWillPop: () async => false,
          child: Container(
              padding: EdgeInsets.only(top: 0, left: 30, bottom: 10, right: 30),
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
                // appBar: AppBar(
                //   backgroundColor: Colors.transparent,
                //   elevation: 0.0,
                // ),
                resizeToAvoidBottomInset : true,
                backgroundColor: Colors.transparent,
                body:SingleChildScrollView(
                child:Form(
                key: _formKey,
          child:Container(
          height: 600,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                      children:<Widget>[
                        IconButton(onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bra()));
                          Navigator.pop(context);
                        }, icon: Icon(FontAwesomeIcons.arrowLeft),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text("Signup",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image(image: AssetImage('images/braicon.png')),
                    SizedBox(
                      child: TextFormField(
                        controller: email_controller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }

                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Example@gmail.com',
                       hintStyle: TextStyle(color: Colors.black),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: pass_controller,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Enter password here',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: name_controller,
                        validator: (value) {
                          if((value.toString()).length>=15  && value != null && value.isNotEmpty){
                            return 'Please enter name shorter then 15 characters';
                          }
                         else if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'your name',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                        String email=email_controller.text.toString();
                        String password=pass_controller.text.toString();
                        String name=name_controller.text.toString();
                        if(_formKey.currentState!.validate()) {
                          AlertDialog alert=new AlertDialog(
                            content:SizedBox(
                                width: 200,
                                height: 200,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget>[
                                    CircularProgressIndicator(),
                                  ]
                                ),
                            ),
                          );
                          showDialog(context: context, builder: (context){
                            Future.delayed(Duration(milliseconds: 200), () {
                              Navigator.of(context).pop();
                            });
                            return alert;
                          });
                          User? user =await registerUsingEmailPassword(
                              name: name, email: email, password: password);
                          if (user != null) {
                            try {
                              await user.sendEmailVerification();
                            } catch (e) {
                              print("An error occured while trying to send email  verification");
                              print(e);
                            }
                            FirebaseFirestore.instance.collection('Users').doc(user.uid).set({'email': user.email,'password':password,'name':user.displayName,'user-id':user.uid,'Verification':user.emailVerified,'active':false});
                            AlertDialog alert = AlertDialog(
                              title: ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                              }, child: Text("Go back to Login page"),
                              ),
                              content: Text("check your inbox or spam folder\nand verify your email"),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                          else {
                            AlertDialog alert = AlertDialog(
                              title: Text("Signup alert"),
                              content: Text(" User not added "),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        }
                      },

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Sign up",
                              style: GoogleFonts.barlow(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Icon(FontAwesomeIcons.user),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((
                              states) => Colors.black),
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
