import 'package:flutter/material.dart';
import 'package:google_notes_lite/EditNoteView.dart';
import 'package:google_notes_lite/colors.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  String note =
      "This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE";
  String note1 = "This IS NOTE This IS NOTE This IS NOTE";
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
            onPressed: () {},
            icon: const Icon(Icons.push_pin_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditNoteView(),
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "HEADING",
              style: TextStyle(
                color: white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              note,
              style: const TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
