import 'package:flutter/material.dart';

class MesajSayfasi extends StatefulWidget {
  @override
  _MesajSayfasiState createState() => _MesajSayfasiState();
}

class _MesajSayfasiState extends State<MesajSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MESAJLAR"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 390,
            child: Text("Mesajlar Tasarlanacak",
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
