import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unicoding/models/account/model.dart';
import 'package:get/get.dart' hide Response;
import 'package:unicoding/services/local_database/shared_preferences.dart';
import 'package:unicoding/view/home/home.dart';
import 'package:unicoding/view/login/login.dart';

class AuthService{
  static RxBool isBusy = false.obs;

  static signIn({required String email, required String password}) async {
    isBusy.value = true;
    FocusScope.of(Get.context!).unfocus();
    try{
      Response res = await Dio().post(
        'http://restapi.adequateshop.com/api/authaccount/login',
        data: jsonEncode({
          "email": email,
          "password": password
        }),
      );

      Map data = res.data['data'];

      Account.current = Account(
          id: data["Id"],
          name: data['Name'],
          email: data['Email'],
          token: data['Token']
      );
      Database.prefs.setString('email', email);
      Database.prefs.setString('password', password);
      Get.offAll(HomePage());
    }
    catch (e){
      Get.showSnackbar(GetSnackBar(title: 'error', message: e.toString().substring(0, min(30, e.toString().length)), duration: Duration(seconds: 3),));
    }
    isBusy.value = false;
  }

  static signOut(){
    Database.prefs.remove('email');
    Database.prefs.remove('password');
    Get.offAll(LoginScreen());
  }
}