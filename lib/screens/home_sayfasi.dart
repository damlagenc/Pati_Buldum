import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobil_projem/screens/anasayfa.dart';
import 'package:mobil_projem/screens/kayiplar_sayfasi.dart';
import 'package:mobil_projem/screens/pati_ekle.dart';
import 'package:mobil_projem/screens/sahiplenme_sayfasi.dart';
import 'package:mobil_projem/ui/widgets/myDrawer.dart';
import 'package:mobil_projem/ui/widgets/my_buttom_navi.dart';
import 'package:mobil_projem/ui/widgets/tab_items.dart';

class HomeSayfasi extends StatefulWidget {
  final User user;

  HomeSayfasi({Key key, this.user}) : super(key: key);

  @override
  _HomeSayfasiState createState() => _HomeSayfasiState();
}

class _HomeSayfasiState extends State<HomeSayfasi> {
  TabItem _currentTab = TabItem.Anasayfa;
  Map<TabItem, Widget> tumSayfalar() {
    return {
      TabItem.Anasayfa: AnasayfaPage(),
      TabItem.Sahiplen: SahiplenmePage(),
      TabItem.Kayiplar: KayiplarPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pati Buldum"),
      ),
      drawer: MyDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatiEkle()));
        },
        tooltip: 'Fotoğraf Yükle',
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.purple,
          size: 30,
        ),
      ),
      body: MyButtomNavigation(
        sayfaOlusturucu: tumSayfalar(),
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {
          setState(() {
            _currentTab = secilenTab;
          });

          print("seçilen tab item: " + secilenTab.toString());
        },
      ),
    );
  }
}
