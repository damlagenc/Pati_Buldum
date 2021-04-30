import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PatiEkle extends StatefulWidget {
  @override
  _PatiEkleState createState() => _PatiEkleState();
}

class _PatiEkleState extends State<PatiEkle> {
  double get height => MediaQuery.of(context).size.height;
  File image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pati Ekle"),
      ),
      body: Center(
        child: image == null ? Text('Fotoğraf seçilmedi.') : Image.file(image),
      ),
      floatingActionButton: buildFloatingActionButtons,
    );
  }

  Widget get buildFloatingActionButtons {
    return Column(
      children: [
        Spacer(),
        buildAppIconButtonNewPhoto,
        SizedBox(height: height * 0.01),
        buildAppIconButtonPickImageFromGallery,
      ],
    );
  }

  FloatingActionButton get buildAppIconButtonNewPhoto {
    return FloatingActionButton.extended(
      label: Text("Fotoğraf Çek"),
      heroTag: Text("Fotoğraf Çek"),
      icon: Icon(Icons.photo_camera),
      onPressed: () => onImageButtonPressed(ImageSource.camera),
    );
  }

  FloatingActionButton get buildAppIconButtonPickImageFromGallery {
    return FloatingActionButton.extended(
      label: Text("Galeriden Seç"),
      heroTag: Text("Galeriden Seç"),
      icon: Icon(Icons.photo_library),
      onPressed: () => onImageButtonPressed(ImageSource.gallery),
    );
  }

  void onImageButtonPressed(ImageSource source) async {
    try {
      await getImage(source);
    } catch (e) {
      print(e);
    }
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      image = File(pickedFile.path);
    });
  }
}
