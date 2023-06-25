import 'package:flutter/material.dart';
import 'package:google_notes_lite/home_screen.dart';
import 'package:google_notes_lite/model/MyNoteModel.dart';
import 'package:google_notes_lite/services/db..dart';
import 'colors.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: bgColor,
        actions: [
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.InsertEntry(
                Note(
                  pin: false,
                  title: title.text,
                  content: content.text,
                  createdTime: DateTime.now(), isArchive: false,
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.save_as_outlined),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: title,
              cursorColor: white,
              style: const TextStyle(
                fontSize: 25,
                color: white,
                fontWeight: FontWeight.bold,
              ),
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
                controller: content,
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
