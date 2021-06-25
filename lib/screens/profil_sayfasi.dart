import 'package:flutter/material.dart';
import 'package:mobil_projem/viewmodel/user_model.dart';
import 'package:mobil_projem/widgets/social_log_in_button.dart';
import 'package:provider/provider.dart';

class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  TextEditingController _controllerUserName;

  @override
  void initState() {
    
    super.initState();
    _controllerUserName = TextEditingController();
  }

  @override
  void dispose() {
    _controllerUserName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel _usermodel = Provider.of<UserModel>(context);
    _controllerUserName.text = _usermodel.user.userName;

    print("Profil sayfasi user değerleri: " + _usermodel.user.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFİL"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(_usermodel.user.profilURL),
                  backgroundColor: Colors.red.shade100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _usermodel.user.email,
                  readOnly:
                      true, //kullanıcı tarafından değiştirilmesini engelliyor.
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controllerUserName,
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adı",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _usermodel.user.adi,
                  decoration: InputDecoration(
                    labelText: "Adınız",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _usermodel.user.soyadi,
                  decoration: InputDecoration(
                    labelText: "Soyadınız",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SocialLoginButton(
                  butonText: "KAYDET",
                  onPressed: () {
                    // _userNameGuncelle(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
/*
  void _userNameGuncelle(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_userModel.user.userName != _controllerUserName.text) {
      //_userModel.updateAdi(_controllerAdi.text);
    } else {
      PlatformDuyarliAlertDialog(
        baslik: "Hata",
        icerik: "Değişiklik yapmadınız!",
        anaButonYazisi: "Tamam",
      ).goster(context);
    }
  }*/
}
