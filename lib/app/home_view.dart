import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobil_projem/screens/anasayfa.dart';
import 'package:mobil_projem/screens/kayiplar_sayfasi.dart';
import 'package:mobil_projem/screens/sahiplenme_sayfasi.dart';
import 'package:mobil_projem/viewmodel/user_model.dart';
import 'package:mobil_projem/widgets/myDrawer.dart';
import 'package:mobil_projem/widgets/my_buttom_navi.dart';
import 'package:mobil_projem/widgets/tab_items.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  final User user;

  const HomeView({Key key, this.user}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TabItem _currentTab = TabItem.Anasayfa;
  final User user;

  _HomeViewState({this.user});
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
        actions: [
          TextButton(
            child: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.white,
            ),
            onPressed: () => _cikisYap(context),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: MyButtomNavigation(
        sayfaOlusturucu: tumSayfalar(),
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {
          setState(() {
            _currentTab = secilenTab;
          });
        },
      ),
    );
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await _userModel.signOut();

    return sonuc;
  }
}
