
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'problems.dart';
import 'maintabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'login.dart';
class Forget_pass extends StatefulWidget {
  const Forget_pass({Key? key}) : super(key: key);

  @override
  _Forget_passState createState() => _Forget_passState();
}

class _Forget_passState extends State<Forget_pass> {
  final email_controller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
      elevation: 0.0,
    ),
    resizeToAvoidBottomInset : true,
    backgroundColor: Colors.transparent,
    body:SingleChildScrollView(
      child:Form(
        key: _formKey,
        child:Container(
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            child: TextFormField(
              controller: email_controller,
              validator: (value){
                if (value==null || value.isEmpty){
                  return 'Enter your email';
                }
                else
                  return null;
              },

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter your existing email',
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
            child: ElevatedButton(onPressed: () async{
              String email = email_controller.text.toString();
                 if (_formKey.currentState!.validate()){
                   AlertDialog alert=new AlertDialog(
                     content:CircularProgressIndicator(),
                   );
                   showDialog(context: context, builder: (context){
                     Future.delayed(Duration(seconds: 2), () {
                       Navigator.of(context).pop();
                     });
                     return alert;
                   });
                   try {
                    await resetPassword(email);

                     AlertDialog alert = AlertDialog(
                       title: Text("Reset alert"),
                       content: Text("Your reset password link is sended to provided email\n Check your spam folder if mail is not in inbox"),
                     );
                     showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return alert;
                       },
                     );
                   }
                   catch(exception){
                     AlertDialog alert = AlertDialog(
                       title: Text("Reset alert"),
                       content: Text("$exception"),
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
                  Text("Reset",
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
    );
  }
}
