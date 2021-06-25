import 'package:mobil_projem/models/user.dart';

abstract class AuthBase {
  Future<Users> currentUser();
  Future<bool> signOut();
  Future<Users> signInWithEmailandPassword(String email, String sifre);
  Future<Users> signInWithGoogle();
  Future<Users> createUserWithEmailandPassword(String email, String sifre);
}
