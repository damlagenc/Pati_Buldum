import 'package:flutter/material.dart';

class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFİL"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 390,
            child: Text("Profil Tasarlanacak",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.all(3),
            color: Colors.purple.shade100,
          ),
        ),
      ),
    );
  }
}
