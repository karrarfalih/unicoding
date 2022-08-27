import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Note {
  final RxString text;
  final Rx<String> title;
  final Rx<Color> color;
  final RxBool isDone;
  final DateTime createdAt;
  final Rx<DateTime> lastModifiedAt;

  Note(String data, this.createdAt, this.lastModifiedAt, [bool? isDone])
      ///Set title
      : isDone = (isDone??false).obs,
        title = "Note ${notes.length + 1}".obs,
        ///Set random color
        color = Colors.accents.elementAt(Random().nextInt(Colors.accents.length)).shade100.obs,
        text = data.obs;

  makeAsDone(){
    isDone.value = true;
  }

  static final RxBool isLoading = false.obs;
  static final RxBool isSaving = false.obs;
  static final RxString typed = ''.obs;

  static RxList<Note> notes = <Note>[].obs;

  static add(String note) async {
    isLoading.value = true;
    Note data = Note(note, DateTime.now(), DateTime.now().obs);
    bool isSuccess = await data.sendRequest();
    if(isSuccess){
      notes.add(data);
    }else{
      Get.snackbar('error', 'Not Saved');
    }
    typed.value = '';
    isLoading.value = false;
  }

  Future<bool> sendRequest() async {
    await Future.delayed(Duration(seconds: 2));
    if(typed.value.length < 5) return false;
    return true;
  }

  static clear(){
    notes.clear();
  }
}
