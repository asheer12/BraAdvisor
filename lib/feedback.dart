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
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Feedback1 extends StatefulWidget {
 final User? user;
 static User? _currentuser;
Feedback1({required this.user});
  @override
  _Feedback1State createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> {
  final body_controller=TextEditingController();
  final subject_controller=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Feedback1._currentuser=widget.user;
    super.initState();
  }



  void _sendEmail(String message, String subject ,String recp) async{
    final Email email = Email(
      body: message,
      subject: subject,
      recipients: [recp],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents,)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
 void launchWhatsApp(String body) async {
   var whatsapp = "+923366575295";
   var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=$body");
   if (await canLaunchUrl(whatsappAndroid)) {
     await launchUrl(whatsappAndroid);
   } else {
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text("WhatsApp is not installed on the device"),
       ),
     );
   }
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
                      controller: subject_controller,
                      validator: (value){
                        if (value==null || value.isEmpty){
                          return 'Enter your name';
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
                        hintText: 'Enter your name here',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      controller: body_controller,
                      validator: (value){
                        if (value==null || value.isEmpty){
                          return 'Enter your feedback';
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
                        hintText: 'Enter your feedback',
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
                      String body = body_controller.text;
                      String name=subject_controller.text;

                      if (_formKey.currentState!.validate()){
                        try {
                          if(Feedback1._currentuser!=null) {
                            FirebaseFirestore.instance.collection('Feedback')
                                .doc(Feedback1._currentuser?.email)
                                .set({'name': name, 'feedback-message': body});
                            AlertDialog alert = AlertDialog(
                              title: Text("Thanks for the feedback"),
                              content: Text("Your feedback is sended"),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                          else{
                            FirebaseFirestore.instance.collection('Feedback-anonymous')
                                .doc()
                                .set({'name': name, 'feedback-message': body});
                            AlertDialog alert = AlertDialog(
                              title: Text("Thanks for the feedback"),
                              content: Text("Your feedback is sended"),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        }
                        catch(exception){
                          AlertDialog alert = AlertDialog(
                            title: Text("Feedback alert"),
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
                          Text("Send",
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
