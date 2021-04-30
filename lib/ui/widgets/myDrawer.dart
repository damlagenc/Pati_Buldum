import 'package:flutter/material.dart';
import 'package:mobil_projem/screens/ayarlar_sayfasi.dart';
import 'package:mobil_projem/screens/login_sayfasi.dart';
import 'package:mobil_projem/screens/mesajlar_sayfasi.dart';
import 'package:mobil_projem/screens/profil_sayfasi.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.pets,
                    color: Colors.white,
                    size: 100.0,
                  ),
                  Text(
                    "Pati Buldum",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Mesajlar'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MesajSayfasi()));
            },
          ),
          Divider(
            color: Colors.purple,
            height: 0,
            indent: 10,
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profil'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilSayfasi()));
            },
          ),
          Divider(
            color: Colors.purple,
            height: 0,
            indent: 10,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AyarlarSayfasi()));
            },
          ),
          Divider(
            color: Colors.purple,
            height: 0,
            indent: 10,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Çıkış'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginSayfasi()));
            },
          ),
          Divider(
            color: Colors.purple,
            height: 0,
            indent: 10,
          ),
        ],
      ),
    );
  }
}
