import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicoding/common/bordered_container.dart';
import 'package:unicoding/services/auth_service/auth.dart';
import 'package:unicoding/utilz/theme.dart';
import 'package:unicoding/view/home/home.dart';
import 'package:unicoding/view/login/text_field.dart';

import '../../models/account/model.dart';
import 'package:get/get.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  submit(){
    AuthService.signIn(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
        child: Column(
          children: [
            Text('Sign In', style: GoogleFonts.cairo(fontSize: 22, color: AppTheme.mainColor),),
            MyTextField(hint: 'Email Address', controller: email, ),
            MyTextField(hint: 'Password', controller: password, isSecure: true),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Center(
                child: GestureDetector(
                    onTap: submit,
                    child: SizedBox(
                      width: 150,
                      height: 60,
                      child: Obx( () {
                          return BorderedContainer(
                              child: AuthService.isBusy.value ? CircularProgressIndicator() : Text('Login', style: GoogleFonts.cairo(fontSize: 22, color: AppTheme.titleColor))
                          );
                        }
                      ),
                    )
                ),
              ),
            )
          ],
        )
    );
  }
}


// class AuthRepo{
//   String email =
// }