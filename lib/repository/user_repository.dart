import 'package:mobil_projem/locator.dart';
import 'package:mobil_projem/models/user.dart';
import 'package:mobil_projem/services/auth_base.dart';
import 'package:mobil_projem/services/fake_auth_service.dart';
import 'package:mobil_projem/services/firebase_auth_service.dart';
import 'package:mobil_projem/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELEASE }

//repo firebase mi fake mi karar vermek için kullanılıyor.

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthService _fakeAuthService = locator<FakeAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<Users> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      Users _user = await _fakeAuthService.currentUser();
      return _user;
    } else {
      Users _user = await _firebaseAuthService.currentUser();
      return await _firestoreDBService.readUser(_user.userID);
    }
  }

//gelen bilgilere göre user ı oluşturup veritabanına kaydediyor. user ı okuyup bilgileri sunuyor
  @override
  Future<Users> createUserWithEmailandPassword(
      String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.createUserWithEmailandPassword(
          email, sifre);
    } else {
      Users _user = await _firebaseAuthService.createUserWithEmailandPassword(
          email, sifre);
      bool _sonuc = await _firestoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _firestoreDBService.readUser(_user.userID);
      } else
        return null;
    }
  }

  @override
  Future<Users> signInWithEmailandPassword(String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithEmailandPassword(email, sifre);
    } else {
      Users _user =
          await _firebaseAuthService.signInWithEmailandPassword(email, sifre);

      return _firestoreDBService.readUser(_user.userID);
    }
  }

  @override
  Future<Users> signInWithGoogle() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithGoogle();
    } else {
      Users _user = await _firebaseAuthService.signInWithGoogle();
      bool _sonuc = await _firestoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _firestoreDBService.readUser(_user.userID);
      } else {
        return null;
      }
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }
}
