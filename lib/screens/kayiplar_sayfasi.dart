import 'package:flutter/material.dart';

import 'package:mobil_projem/screens/pati_ekle.dart';

class KayiplarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        title: Text("Kayıplar"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatiEkle()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.purple,
          size: 40,
        ),
      ),
    );
  }
}
