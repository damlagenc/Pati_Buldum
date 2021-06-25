import 'package:flutter/material.dart';
import 'package:mobil_projem/app/sign_in/email_sifre_giris_ve_kayit.dart';
import 'package:mobil_projem/models/user.dart';
import 'package:mobil_projem/screens/hakkinda_sayfasi.dart';
import 'package:mobil_projem/viewmodel/user_model.dart';
import 'package:mobil_projem/widgets/social_log_in_button.dart';
import 'package:provider/provider.dart';

class Authentication extends StatelessWidget {
  void _googleIleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    Users _user = await _userModel.signInWithGoogle();
  }

  void _emailVeSifreGiris(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailveSifreLoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("PATİ BULDUM"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.blueGrey.shade50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 450,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/oturum-ac.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
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
                    onPressed: () => _emailVeSifreGiris(context),
                    butonIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 32,
                    ),
                    butonText: "Email ve Şifre ile Giriş yap",
                  ),
                  SocialLoginButton(
                    butonText: "Gmail ile Oturum Aç",
                    textColor: Colors.black,
                    onPressed: () => _googleIleGiris(context),
                    butonColor: Colors.white,
                    butonIcon: Image.asset("assets/images/google-logo.png"),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                      ),
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
          ],
        ),
      ),
    );
  }
}
