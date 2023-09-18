import 'package:my_flash_chat/screens/login_screen.dart';
import 'package:my_flash_chat/screens/registration_screen.dart';
import 'package:my_flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_flash_chat/components/init_card.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome', logoTag = 'logo';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation logoAnimation, colorAnimation, textColorAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    logoAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    colorAnimation = ColorTween(begin: Colors.white, end: Color(0xFF0A0E35))
        .animate(controller);
    textColorAnimation = ColorTween(begin: Color(0xFF0A0E35), end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: WelcomeScreen.logoTag,
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value * 100,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: textColorAnimation.value,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Agne',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            InitCard(text: 'Log In', onPressed: (){Navigator.pushNamed(context, LoginScreen.id);}, cardColor: loginColor,),
            InitCard(text: 'Register', onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);}, cardColor: registerColor,),
          ],
        ),
      ),
    );
  }

}

