import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_sayfasi.dart';

class KayitSayfasi extends StatefulWidget {
  @override
  _KayitSayfasiState createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  String _emailAdres, _sifre, _telefonNo, _ad, _soyad;
  bool otomotikKontrol = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Form(
            autovalidate: otomotikKontrol,
            key: formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Ad',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (String girilenVeri) {
                      if (girilenVeri.length < 2) {
                        return "Tam adınızı giriniz.";
                      } else
                        return null;
                    },
                    onSaved: (deger) => _ad = deger,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Soyad',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (String girilenVeri) {
                      if (girilenVeri.length < 2) {
                        return "Tam soyadınızı giriniz.";
                      } else
                        return null;
                    },
                    onSaved: (deger) => _soyad = deger,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'E-posta adresi',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: _emailKontrol,
                    onSaved: (deger) => _emailAdres = deger,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Telefon Numarası',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (String girilenVeri) {
                      if (girilenVeri.length < 11) {
                        return "Eksik telefon numarası.";
                      } else
                        return null;
                    },
                    onSaved: (deger) => _telefonNo = deger,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Şifre',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (String girilenVeri) {
                      if (girilenVeri.length < 7) {
                        return "Şifrenizi giriniz.";
                      } else
                        return null;
                    },
                    onSaved: (deger) => _sifre = deger,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _kayitBilgileriniOnayla;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeSayfasi()),
                      );
                    },
                    child: Text("Kayıt Ol"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _kayitBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Girilen mail: $_emailAdres şifre: $_sifre  Ad: $_ad Soyad:$_soyad Telefon no: $_telefonNo");
    } else {
      setState(() {
        otomotikKontrol = true;
      });
    }
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(mail))
      return "Geçersiz mail";
    else
      return null;
  }

  void main() {
    print(_emailKontrol("damla@gmail.com"));
  }
}
