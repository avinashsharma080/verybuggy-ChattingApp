import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      upperBound: 100,
    );
    controller.forward();
    animation = ColorTween(begin: Colors.blueAccent, end: Colors.amber)
        .animate(controller);

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                ),
                RotateAnimatedTextKit(
                  repeatForever: true,
                  text: ['TALK ME'],
                  textStyle: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Horizon"),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
                text: "Log IN",
                color: Colors.lightBlueAccent,
                onpressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundButton(
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.blueAccent,
              text: "Register",
            )
          ],
        ),
      ),
    );
  }
}
