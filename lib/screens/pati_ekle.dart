import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class PatiEkle extends StatefulWidget {
  @override
  _PatiEkleState createState() => _PatiEkleState();
}

class _PatiEkleState extends State<PatiEkle> {
  //metin değişkenleri
  String baslik, aciklama, adres;

  //resim değişkenleri
  File _resim;
  final secici = ImagePicker();

  //galeriden resim alıp değişkene aktarma
  Future resimAl() async {
    //al ve değişkene ata
    final secilenDosya = await secici.getImage(source: ImageSource.gallery);

    setState(() {
      //dosya yolunu değişkene aktar
      _resim = File(secilenDosya.path);
    });
  }

  gonderiYukle() async {
    if (_resim != null) {
      //resmi gönder
      Reference depolamaYolu = FirebaseStorage.instance
          .ref()
          .child("kayipResimleri")
          .child("${randomAlphaNumeric(9)}");
      //yükleme görevi
      UploadTask resimYuklemeGorevi = depolamaYolu.putFile(_resim);
      //resim url al
      var resimUrl = await resimYuklemeGorevi.then((res) {
        res.ref.getDownloadURL();
      });

      Fluttertoast.showToast(msg: "URL: " + resimUrl.toString());

      //çoklu veri gönder
      Map<String, String> gonderiCokluVerisi = {
        "resimURL": resimUrl,
        "baslik": baslik,
        "açıklama": aciklama,
        "adres": adres,
      };
      //veri tabanına ekleme
/*
      DocumentReference veriYolu =
      FirebaseFirestore.instance.collection("Gonderiler").doc();
      veriYolu.set(gonderiCokluVerisi)
*/
    } else {
      Fluttertoast.showToast(msg: "Fotoğraf seçin!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pati Ekle"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //gönderiyi firebase ekleme
              gonderiYukle();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Icon(
                Icons.file_upload,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                resimAl();
              },
              child: _resim != null
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _resim,
                          fit: BoxFit.cover,
                        ),
                      ))
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.purple,
                      ),
                    ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Başlık yazın",
                      labelText: "Başlık",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (oge) {
                      //kontrolden al değişkene aktar
                      baslik = oge;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Açıklama yazın",
                      labelText: "Açıklama",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (oge) {
                      //kontrolden al değişkene aktar
                      aciklama = oge;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Adres yazın",
                      labelText: "Adres",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (oge) {
                      //kontrolden al değişkene aktar
                      adres = oge;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: " ",
                      labelText: " ",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
