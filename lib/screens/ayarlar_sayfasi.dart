import 'package:flutter/material.dart';

class AyarlarSayfasi extends StatefulWidget {
  @override
  _AyarlarSayfasiState createState() => _AyarlarSayfasiState();
}

class _AyarlarSayfasiState extends State<AyarlarSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AYARLAR"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 390,
            child: Text("Ayarlar Tasarlanacak",
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
