import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_withfirebase/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  TextEditingController _tielecontroller = TextEditingController();
  TextEditingController _maincontroller = TextEditingController();

  int colorId = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
        title: const Text(
          "Add New Notes",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _tielecontroller,
              style: AppStyle.mainTitle,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Note Title ",
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: AppStyle.datetimeTitle,
            ),
            const SizedBox(
              height: 28.0,
            ),
            TextFormField(
              controller: _maincontroller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: AppStyle.mainTitle,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter description ",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection("notes").add({
            "note_title": _tielecontroller.text,
            "creator_date_time": date,
            "note_content": _maincontroller.text,
            "color_id": colorId,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("Failed to add new note due to $error"));
        },
        child: const Icon(
          Icons.save,
        ),
      ),
    );
  }
}
