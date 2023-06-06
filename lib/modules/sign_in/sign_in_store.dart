import 'dart:convert';

import 'package:cttns/models/login_user.dart';
import 'package:cttns/modules/global_store.dart';
import 'package:cttns/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_in_state.dart';

class SignInStore extends MobXStore<SignInModel> {
  SignInStore(this.goToAccountPage) : super(SignInInitState());
  final VoidCallback goToAccountPage;
  final AuthService _authService = AuthService();
  final GlobalStore _globalStore = Modular.get<GlobalStore>();
  Future signIn() async {
    setLoading(true);
    LoginUser loginUser = LoginUser(
        username: state.usernameController.text,
        password: state.pwdController.text);

    Map<String, dynamic>? error;
    WPUser? wpUser = await _authService.login(loginUser, onError: (res) {
      error = res;
    });
    if (error != null) {
      setLoading(false);
      // setError(error!["message"]);/
      return {};
    }

    update(SignInSuccess(user: wpUser));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("currentUser", json.encode(wpUser));
    _globalStore.currentUser = wpUser;
    _globalStore.isLogin = true;
    goToAccountPage();
    setLoading(false);
    return {};
  }

  Future signInWithGoogle() async {
    setLoading(true);
    await Future.delayed(const Duration(milliseconds: 300));
    setLoading(false);
    // setError(Exception('Some things went wrong'));
  }

  Future forgetPassword() async {
    setLoading(true);
    await Future.delayed(const Duration(milliseconds: 300));
    setLoading(false);
    // setError(Exception('Some things went wrong'));
  }
}
