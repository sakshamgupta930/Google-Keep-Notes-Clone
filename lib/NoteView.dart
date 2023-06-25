import 'package:flutter/material.dart';
import 'package:google_notes_lite/ArchiveView.dart';
import 'package:google_notes_lite/EditNoteView.dart';
import 'package:google_notes_lite/colors.dart';
import 'package:google_notes_lite/home_screen.dart';
import 'package:google_notes_lite/services/db..dart';

import 'model/MyNoteModel.dart';

class NoteView extends StatefulWidget {
  Note note;
  NoteView({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.pinNote(widget.note);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            icon: widget.note.pin
                ? Icon(Icons.push_pin)
                : Icon(Icons.push_pin_outlined),
          ),
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.archiveNote(widget.note);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            icon: widget.note.isArchive
                ? Icon(Icons.archive_rounded)
                : Icon(Icons.archive_outlined),
          ),
          IconButton(
            onPressed: () async {
              await NotesDatabase.instance.deleteNote(widget.note);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: const Icon(Icons.delete_outlined),
          ),
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNoteView(
                    note: widget.note,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.title,
              style: const TextStyle(
                color: white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.note.content,
              style: const TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
