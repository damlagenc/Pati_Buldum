import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobil_projem/screens/hakkinda_sayfasi.dart';
import 'package:mobil_projem/screens/home_sayfasi.dart';
import 'package:mobil_projem/ui/widgets/social_log_in_button.dart';

class LoginSayfasi extends StatefulWidget {
  @override
  _LoginSayfasiState createState() => _LoginSayfasiState();
}

class _LoginSayfasiState extends State<LoginSayfasi> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(hintColor: Colors.purple),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Pati Buldum"),
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Oturum Açın",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                SizedBox(
                  height: 8,
                ),
                SocialLoginButton(
                  butonText: "Gmail ile Giriş Yap",
                  textColor: Colors.black87,
                  butonColor: Colors.white,
                  butonIcon: Image.asset("images/google-logo.png"),
                  onPressed: () {},
                ),
                SocialLoginButton(
                  butonText: "Facebook ile Oturum Aç",
                  butonIcon: Image.asset("images/facebook-logo.png"),
                  onPressed: () {},
                  butonColor: Color(0xFF334D92),
                ),
                SocialLoginButton(
                  onPressed: () {},
                  butonIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 34,
                  ),
                  butonText: "Email ve Şifre ile Giriş Yap",
                ),
                SocialLoginButton(
                  onPressed: () {
                    _misafirGirisi();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeSayfasi()),
                    );
                  },
                  butonIcon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                    size: 34,
                  ),
                  butonText: "Misafir Girişi",
                  butonColor: Colors.teal,
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HakkindaSayfasi()),
                      );
                    },
                    child: Text("Hakkında"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _misafirGirisi() async {
    User user = (await FirebaseAuth.instance.signInAnonymously()).user;
    print('Oturum açan user id' + user.uid.toString());
  }
}
