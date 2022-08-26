import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womenbra/guesthome.dart';
import 'package:womenbra/main.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'problems.dart';
import 'maintabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'forgetpassword.dart';
import 'guesthome.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email_controller=TextEditingController();
  final pass_controller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  static Future<User?> loginusingemailpassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user=userCredential.user;
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    catch(e){
      print("Separate : $e");
    }
    return user;
  }
  @override
  void initState() {

    super.initState();
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
        height: 750,
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            resizeToAvoidBottomInset : true,
            backgroundColor: Colors.transparent,
            body:SingleChildScrollView(
             child: Form(
                key: _formKey,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
                    Text("Login ",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                    Image(image: AssetImage('images/braicon.png')),
              //  SizedBox(height: 30,),
            Container(
                  height: 200,
                  child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                      validator: (value){
                        if (value==null || value.isEmpty){
                          return 'Enter your password';
                        }
                        else
                          return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                ],),),


                TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Forget_pass()));
                },
                    child: Text("Forget your password?",style: GoogleFonts.barlow(color: Colors.white,fontSize: 19),)),

                Container(
                  height: 240,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(onPressed: () async{
                    String email = email_controller.text.toString();
                    String password = pass_controller.text.toString();
                    try {
                      if (_formKey.currentState!.validate())  {
                        AlertDialog alert=new AlertDialog(
                          content:SizedBox(
                            width: 200,
                              height: 200,
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget>[CircularProgressIndicator()]),
                          ),
                        );
                        showDialog(context: context, builder: (context){
                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.of(context).pop();
                          });
                          return alert;
                        });
                        User? user = await loginusingemailpassword(
                            email: email,
                            password: password,
                            context: context
                        );
                        if (user != null) {
                          if (user.emailVerified) {
                            FirebaseFirestore.instance.collection('Users').doc(user.uid).update({'Verification':user.emailVerified,'active':true});
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Tabs(user: user,)));
                          }
                          else {
                            AlertDialog alert = AlertDialog(
                              title: Text("Login alert"),
                              content: Text("Email is not verified"),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        }
                        else {
                          AlertDialog alert = AlertDialog(
                            title: Text("Login alert"),
                            content: Text(" User not found"),
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                      }
                    }
                    catch(exception){
                      print("Exception is: $exception");
                    }
                  },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Login",
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
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Signip()));
                  },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Create New Account",
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70)
                        ),
                      ),
                    ),
                  ),
                ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Guest()));
                        },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Guest login",
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
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(70)
                              ),
                            ),
                          ),
                        ),
                      ),
                      ]
                  ),
                ),
              ],
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
