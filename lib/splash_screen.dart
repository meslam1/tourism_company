import 'dart:async';
import 'package:flutter/material.dart';
import 'introduction_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/logo.png',width: 200,height: 200),
      ),
    );
  }

  Future<Timer> startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration,navigationPage);
  }
  void navigationPage(){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => IntroScreen()));
  }
}
