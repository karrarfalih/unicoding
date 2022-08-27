
import 'package:flutter/material.dart';
import 'package:unicoding/model.dart';
import 'package:get/get.dart';
import 'package:unicoding/view/home/card_preview.dart';
import 'package:unicoding/view/note_page/main.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key, required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        Get.to(NotePage(note: note,));
      },
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
        padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20),
        decoration: BoxDecoration(
            color: note.color.value,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                    return Text(
                      note.title.value,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold),
                    );
                  }
                ),
                TextButton(
                    onPressed: (){
                      note.makeAsDone();
                    },
                    child: Icon(Icons.check, color: Colors.black,)
                )
              ],
            ),
            const SizedBox(height: 5),
            Obx(
              () {
                return Text(
                  note.text.value,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.black54),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

