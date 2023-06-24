import 'package:flutter/material.dart';
import 'package:google_notes_lite/NoteView.dart';
import 'package:google_notes_lite/colors.dart';
import 'package:google_notes_lite/services/db..dart';

import 'model/MyNoteModel.dart';

class EditNoteView extends StatefulWidget {
  Note note;
  EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late String NewTitle;
  late String NewNoteDet;

  @override
  void initState() {
    super.initState();
    NewTitle = widget.note.title.toString();
    NewNoteDet = widget.note.content.toString();
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
              Note newNote = Note(
                id: widget.note.id,
                pin: false,
                title: NewTitle,
                content: NewNoteDet,
                createdTime: widget.note.createdTime,
              );
              await NotesDatabase.instance.updateNote(newNote);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteView(note: newNote),
                ),
              );
            },
            icon: const Icon(Icons.save_as_outlined),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                initialValue: NewTitle,
                cursorColor: white,
                onChanged: (value) {
                  NewTitle = value;
                },
                style: const TextStyle(
                    fontSize: 25, color: white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: Form(
                child: TextFormField(
                  onChanged: (value) {
                    NewNoteDet = value;
                  },
                  initialValue: NewNoteDet,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
