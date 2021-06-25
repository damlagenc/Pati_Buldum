import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:mobil_projem/app/home_view.dart';
import 'package:mobil_projem/app/landing_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(),
          ));
    });
  }

  Function duringSplash = () {
    int a = 123 + 23;

    if (a > 100)
      return 1;
    else
      return 2;
  };
  Map<int, Widget> op = {1: LandingPage(), 2: HomeView()};
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'assets/images/pets_save.png',
      home: LandingPage(),
      customFunction: duringSplash,
      duration: 2500,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    );
  }
}
