import 'package:flutter/material.dart';
import 'package:mobil_projem/app/home_view.dart';
import 'package:mobil_projem/app/sign_in/authentication.dart';
import 'package:mobil_projem/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return Authentication();
      } else {
        return HomeView();
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
