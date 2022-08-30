import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicoding/models/account/model.dart';
import 'package:unicoding/models/note/model.dart';
import 'package:unicoding/services/auth_service/auth.dart';
import 'package:unicoding/view/home/list.dart';
import 'package:unicoding/view/home/navaigation_buttons.dart';
import 'package:unicoding/view/home/text_field.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${Account.current.name}', style: TextStyle(color: Colors.black, fontSize: 22),),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: const Color(0xfff0f0f0),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: AuthService.signOut,
              child: Icon(Icons.logout))
        ],
      ),
      backgroundColor: const Color(0xfff0f0f0),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            MyInputField(myController: myController),
            NavigatorButtons(),
            Expanded(
              child: CardsList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Note.clear();
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
