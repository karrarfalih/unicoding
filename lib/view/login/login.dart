import 'package:flutter/material.dart';
import 'package:unicoding/view/login/login_card.dart';
import 'package:unicoding/view/login/title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: ListView(
            children: [
              LoginTitle(),
              SizedBox(height: 40,),
              LoginCard(),
            ],
          ),
        ),
      ),
    );
  }
}
