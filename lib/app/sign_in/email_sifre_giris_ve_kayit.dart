import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobil_projem/app/hata_exception.dart';
import 'package:mobil_projem/models/user.dart';
import 'package:mobil_projem/viewmodel/user_model.dart';
import 'package:mobil_projem/widgets/platform_duyarli_alert_dialog.dart';
import 'package:mobil_projem/widgets/social_log_in_button.dart';
import 'package:provider/provider.dart';

enum FormType { Register, LogIn }

class EmailveSifreLoginPage extends StatefulWidget {
  const EmailveSifreLoginPage({Key key}) : super(key: key);

  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String _email, _sifre;
  String _butonText, _linkText;
  var _formType = FormType.LogIn;
  final _formKey = GlobalKey<FormState>();

  void _formSubmit() async {
    _formKey.currentState.save();
    //debugPrint("email: " + _email + ' ' + "sifre: " + _sifre);
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_formType == FormType.LogIn) {
      try {
        Users _girisYapanUser =
            await _userModel.signInWithEmailandPassword(_email, _sifre);
        if (_girisYapanUser != null)
          print("Oturum açan user id:" + _girisYapanUser.userID.toString());
      } catch (e) {
        debugPrint("Widget oturum açma hata yakalandı: " + e.code.toString());
        PlatformDuyarliAlertDialog(
          baslik: "Oturum Açılamadı",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    } else {
      try {
        Users _olusturulanUser =
            await _userModel.createUserWithEmailandPassword(_email, _sifre);
        if (_olusturulanUser != null)
          print("Oluşturulan user id:" + _olusturulanUser.userID.toString());
      } catch (e) {
        debugPrint(
            "Widget kullanıcı oluşturma hata yakalandı: " + e.code.toString());
        PlatformDuyarliAlertDialog(
          baslik: "Kullanıcı Oluşturulamadı",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    }
  }

  void _degistir() {
    setState(() {
      _formType =
          _formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    _butonText = _formType == FormType.LogIn ? " Giriş Yap " : " Kayıt Ol ";
    _linkText = _formType == FormType.LogIn
        ? " Hesabınız Yok Mu ? Kayıt Olun... "
        : " Hesabınız Varsa Giriş Yapın ";

    final _userModel = Provider.of<UserModel>(context);
//kullanıcı varsa açtığımız fullScreenDialog sayfasını kapatmak için kullandık
    if (_userModel.user != null) {
      Future.delayed(Duration(milliseconds: 10), () {
        Navigator.of(context).pop();
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Giriş/Kayıt"),
        ),
        body: _userModel.state == ViewState.Idle
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (String girilenEmail) {
                            _email = girilenEmail;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Şifre',
                            labelText: 'Şifre',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (String girilenSifre) {
                            _sifre = girilenSifre;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SocialLoginButton(
                          butonText: _butonText,
                          butonColor: Theme.of(context).primaryColor,
                          onPressed: () => _formSubmit(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () => _degistir(),
                          child: Text(
                            _linkText,
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
/*
enum FormType { Register, LogIn }

class EmailveSifreLoginPage extends StatefulWidget {
  const EmailveSifreLoginPage({Key key}) : super(key: key);

  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String _email, _sifre;
  String _butonText, _linkText;
  var _formType = FormType.LogIn;
  final _formKey = GlobalKey<FormState>();

  void _formSubmit() async {
    _formKey.currentState.save();
    //debugPrint("email: " + _email + ' ' + "sifre: " + _sifre);
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_formType == FormType.LogIn) {
      Users _girisYapanUser =
      await _userModel.signInWithEmailandPassword(_email, _sifre);
      if (_girisYapanUser != null)
        print("Oturum açan user id:" + _girisYapanUser.userID.toString());
    } else {
      Users _olusturulanUser =
      await _userModel.createUserWithEmailandPassword(_email, _sifre);
      if (_olusturulanUser != null)
        print("Oluşturulan user id:" + _olusturulanUser.userID.toString());
    }
  }

  void _degistir() {
    setState(() {
      _formType =
      _formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    _butonText = _formType == FormType.LogIn ? " Giriş Yap " : " Kayıt Ol ";
    _linkText = _formType == FormType.LogIn
        ? " Hesabınız Yok Mu ? Kayıt Olun... "
        : " Hesabınız Varsa Giriş Yapın ";

    final _userModel = Provider.of<UserModel>(context);
//kullanıcı varsa açtığımız fullScreenDialog sayfasını kapatmak için kullandık
    if (_userModel.user != null) {
      Future.delayed(Duration(milliseconds: 10), () {
        Navigator.of(context).pop();
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Giriş/Kayıt"),
        ),
        body: _userModel.state == ViewState.Idle
            ? SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (String girilenEmail) {
                      _email = girilenEmail;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Şifre',
                      labelText: 'Şifre',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (String girilenSifre) {
                      _sifre = girilenSifre;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SocialLoginButton(
                    butonText: _butonText,
                    butonColor: Theme.of(context).primaryColor,
                    onPressed: () => _formSubmit(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => _degistir(),
                    child: Text(
                      _linkText,
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ));
  }
}
 */
