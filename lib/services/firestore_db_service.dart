import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobil_projem/models/user.dart';
import 'package:mobil_projem/services/db_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<bool> saveUser(Users user) async {
    await _firestore.collection("Users").doc(user.userID).set(user.toMap());

    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("Users/${user.userID}").get();

    Map _okunanUserBilgileriMap = _okunanUser.data();
    Users _okunanUserBilgileriNesne = Users.fromMap(_okunanUserBilgileriMap);
    print("Okunan user nesnesi: " + _okunanUserBilgileriNesne.toString());
    return true;
  }

  @override
  Future<Users> readUser(String userID) async {
    DocumentSnapshot _okunanUser =
        await _firestore.collection("Users").doc(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap = _okunanUser.data();

    Users _okunanUserNesnesi = Users.fromMap(_okunanUserBilgileriMap);
    print("Okunan user nesnesi : " + _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }
/*
  @override
  Future<bool> updateUserName(String userID, String yeniUserName) async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      Query<Map<String, dynamic>> reference = _firestore
          .collection("Users")
          .where("userName", isEqualTo: yeniUserName);
      await reference.add(({
        'userName': yeniUserName,
      }));
    });
  }

 */
}
