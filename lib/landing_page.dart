import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobil_projem/screens/home_sayfasi.dart';
import 'package:mobil_projem/screens/login_sayfasi.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Firebase _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return LoginSayfasi();
    } else {
      return HomeSayfasi();
    }
  }

  Future<void> _checkUser() async {
    _user = (await FirebaseAuth.instance.currentUser) as Firebase;
  }
}
