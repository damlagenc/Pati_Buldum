import 'package:mobil_projem/models/user.dart';

abstract class DBBase {
  Future<bool> saveUser(Users user);
  Future<Users> readUser(String userID);
//Future<bool> updateUserName(String userID, String yeniUserName);
}
