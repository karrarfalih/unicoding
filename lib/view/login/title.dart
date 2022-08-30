import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicoding/utilz/theme.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: GoogleFonts.cairo(fontSize: 26, color: AppTheme.titleColor),),
        Text(
            'To Computiq Academy',
        style: GoogleFonts.cairo(fontSize: 26, color: AppTheme.mainColor
        ),
        )
      ],
    );
  }
}
