import 'package:flutter/material.dart';
import 'package:google_notes_lite/colors.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: bgColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_as_outlined),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              cursorColor: white,
              style: TextStyle(fontSize: 25, color: white,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                cursorColor: white,
                style: const TextStyle(fontSize: 17, color: white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Note",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
