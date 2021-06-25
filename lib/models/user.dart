import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users {
  final String userID;
  String email;
  String userName;
  String adi;
  String soyadi;
  String profilURL;
  DateTime createdAt;
  DateTime updatedAt;

  Users({@required this.userID, @required this.email});
/*
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
*/
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'userName':
          userName ?? email.substring(0, email.indexOf("@")) + randomSayiUret(),
      'adi': adi ?? ' ',
      'soyadi': soyadi ?? ' ',
      'profilURL': profilURL ?? 'assets/images/profil.png',
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  Users.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        adi = map['adi'],
        soyadi = map['soyadi'],
        profilURL = map['profilURL'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate();

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, userName $userName,adi $adi, soyadi $soyadi,  profilURL:  $profilURL, createdAt: $createdAt, }';
  }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999);
    return rastgeleSayi.toString();
  }
}
