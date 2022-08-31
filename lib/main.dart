import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicoding/services/local_database/shared_preferences.dart';
import 'package:get/get.dart' hide Response;
import 'package:unicoding/view/wrapper/wrapper.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Database.prefs = await SharedPreferences.getInstance();
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
      home: const Wrapper(),
    );
  }
}






