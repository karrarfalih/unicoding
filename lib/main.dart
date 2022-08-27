
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicoding/view/home/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uni-coding',
      theme: ThemeData(
        primaryColor: const Color(0xff08df78)
      ),
      home: const HomePage(),
    );
  }
}






