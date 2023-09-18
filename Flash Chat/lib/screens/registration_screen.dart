import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flash_chat/components/init_card.dart';
import 'package:my_flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_flash_chat/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegistrationScreen extends StatefulWidget {
  static String id = 'reg';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email, password;
  bool _spin = false;
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:mainColor,
      body: ModalProgressHUD(
        inAsyncCall: _spin ,
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  style: TextStyle(color:Colors.white ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your Email")),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  style: TextStyle(color:Colors.white),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your password")),
              SizedBox(
                height: 24.0,
              ),
              InitCard(
                text: 'Register',
                onPressed: () async {
                  setState(() {
                    _spin=true;
                  });
                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(user!=null)
                      Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      _spin=false;
                    });
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    _spin=false;
                  });
                },
                cardColor: registerColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
