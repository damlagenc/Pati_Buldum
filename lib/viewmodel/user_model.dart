import 'package:flutter/material.dart';
import 'package:mobil_projem/locator.dart';
import 'package:mobil_projem/models/user.dart';
import 'package:mobil_projem/repository/user_repository.dart';
import 'package:mobil_projem/services/auth_base.dart';

enum ViewState { Idle, Busy }

// istekleri repository e gönderen class olacak
//repoyu çağıran yer
class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  Users _user;
  String emailHataMesaji;
  String sifreHataMesaji;

  Users get user => _user;

  set user(Users value) {
    _user = value;
    notifyListeners();
  }

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    //arayüze bilgi verir
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<Users> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users> createUserWithEmailandPassword(
      String email, String sifre) async {
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user =
            await _userRepository.createUserWithEmailandPassword(email, sifre);
        return _user;
      } else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("Viewmodeldeki signInWithGoogle hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users> signInWithEmailandPassword(String email, String sifre) async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithEmailandPassword(email, sifre);
      if (_user != null)
        return _user;
      else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailSifreKontrol(String email, String sifre) {
    var sonuc = true;

    if (sifre.length < 6) {
      sifreHataMesaji = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      sifreHataMesaji = null;
    if (!email.contains('@')) {
      emailHataMesaji = "Geçersiz email adresi";
      sonuc = false;
    } else
      emailHataMesaji = null;
    return sonuc;
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    } catch (e) {
      debugPrint("Viewmodeldeki SignOut hata:" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }
}
