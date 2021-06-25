import 'package:mobil_projem/models/user.dart';
import 'package:mobil_projem/services/auth_base.dart';

class FakeAuthService implements AuthBase {
  String userID = "123456789";
  String email = "destek@gmail.com";
  @override
  Future<Users> currentUser() async {
    return await Future.value(Users(userID: userID, email: email));
  }

  @override
  Future<Users> createUserWithEmailandPassword(
      String email, String sifre) async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => Users(
            userID: "created_user_id_123456", email: "fakeuser@fake.com"));
  }

  @override
  Future<Users> signInWithEmailandPassword(String email, String sifre) async {
    return await Future.delayed(
        Duration(seconds: 2),
        () =>
            Users(userID: "signIn_user_id_123456", email: "fakeuser@fake.com"));
  }

  @override
  Future<Users> signInWithGoogle() async {
    return await Future.delayed(
        Duration(seconds: 2),
        () =>
            Users(userID: "google_user_id_123456", email: "fakeuser@fake.com"));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }
}
