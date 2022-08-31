import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:flutter/material.dart';

class Note extends GetxController{
  final RxString text;
  final Rx<String> title;
  final Color color;
  final RxBool isDone;
  final DateTime createdAt;
  final Rx<DateTime> lastModifiedAt;

  Note(String data, this.createdAt, this.lastModifiedAt, [bool? isDone])
      ///Set title
      : isDone = (isDone??false).obs,
        title = "Note ${notes.length + 1}".obs,
        ///Set random color
        color = Colors.accents.elementAt(Random().nextInt(Colors.accents.length)).shade100,
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

  String toJson(){
    Map map = {
      'text' : text.value,
      'title' : title.value,
      'color' : color.value,
      'isDone' : isDone.value,
      'createdAt' : createdAt.millisecondsSinceEpoch,
      'lastModifiedAt' : lastModifiedAt.value.millisecondsSinceEpoch,
    };
    return jsonEncode(map);
  }

  Note fromJson(String data){
    Map map = jsonDecode(data);
    return Note(
        map['text'],
        DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
        DateTime.fromMillisecondsSinceEpoch(map['lastModifiedAt']).obs,
    );
  }

  static Note fromMap(Map map){
    return Note(map['title'], DateTime.now(), DateTime.now().obs, map['completed']);
  }

  static Future<void> getNotes() async {
    Response res = await Dio().get('https://jsonplaceholder.typicode.com/todos');

    (res.data as List).forEach((e) {
      notes.add(Note.fromMap(e));
    });
  }
}
