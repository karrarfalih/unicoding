
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicoding/models/note/model.dart';
import 'package:unicoding/view/home/card.dart';


class CardsList extends StatelessWidget {
  const CardsList({
    Key? key,}) : super(key: key);

  static PageController controller = PageController();
  static RxInt currentPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageView(
        controller: controller,
        onPageChanged: (x){
          currentPage.value = x;
        },
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Note.notes.isNotEmpty ? ListView(
              controller: ScrollController(),
              children: Note.notes.where((e) => !e.isDone.value).map((e) => MyCard(note: e,)).toList(),
            ):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.note_add, size: 100, color: Colors.grey.withOpacity(0.5),),
                Text('Add your first note.', style: TextStyle(fontSize: 20, color: Colors.grey),)
              ],
            ),
          ),
          ListView(
            controller: ScrollController(),
            children: Note.notes.where((e) => e.isDone.value).map((e) => MyCard(note: e,)).toList(),
          ),
        ],
      );
    }
    );
  }
}
