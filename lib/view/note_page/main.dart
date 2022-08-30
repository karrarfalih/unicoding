import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicoding/models/note/model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  @override
  void initState() {
    title.text = widget.note.title.value;
    body.text = widget.note.text.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        automaticallyImplyLeading: false,
        actions: [
          Obx(
            () {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: (!Note.isSaving.value) ? TextButton(
                    onPressed: () async {
                      Note.isSaving.value = true;
                      await Future.delayed(Duration(seconds: 2));
                      widget.note.title.value = title.text;
                      widget.note.text.value = body.text;
                      widget.note.lastModifiedAt.value = DateTime.now();
                      Note.isSaving.value = false;
                      Get.back();
                    },
                    child: Text('Save',)
                ): SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 2,
                  ),
                ),
              );
            }
          )
        ],
        // leadingSizedBox(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
            TextField(
              controller: body,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: 'Type some thing',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
              ),
            ),
            Spacer(),
            Text(DateFormat('d MMM, h:mm a').format(widget.note.lastModifiedAt.value))
          ],
        ),
      ),
    );
  }
}
