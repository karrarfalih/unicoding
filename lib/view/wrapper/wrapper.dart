import 'package:flutter/material.dart';
import 'package:unicoding/services/auth_service/auth.dart';
import 'package:unicoding/services/local_database/shared_preferences.dart';
import 'package:unicoding/view/login/login.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  login() async {
    await Future.delayed(Duration(seconds: 2));
    try{
      String? email = Database.prefs.getString('email');
      String? password = Database.prefs.getString('password');
      if(email != null && password != null){
        AuthService.signIn(email: email, password: password);
      }else{
        Get.offAll(LoginScreen());
      }
    }catch (e){
      Get.offAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    login();
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
