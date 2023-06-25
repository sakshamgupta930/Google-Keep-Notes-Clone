import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_notes_lite/colors.dart';
import 'package:google_notes_lite/services/db..dart';

import 'NoteView.dart';
import 'model/MyNoteModel.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<int> SearchResultIDs = [];
  List<Note?> SearchResultNotes = [];

  bool isLoading = false;

  void SearchResults(String query) async {
    SearchResultNotes.clear();
    setState(() {
      isLoading = true;
    });
    final ResultIds =
        await NotesDatabase.instance.getNoteString(query); //= [1,2,3,4,5]
    List<Note?> SearchResultNotesLocal = []; //[nOTE1, nOTE2]
    ResultIds.forEach((element) async {
      final SearchNote = await NotesDatabase.instance.readOneNote(element);
      SearchResultNotesLocal.add(SearchNote);
      setState(() {
        SearchResultNotes.add(SearchNote);
      });
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: white.withOpacity(0.1),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: white,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Search Your Notes",
                        hintStyle: TextStyle(
                          color: white.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          SearchResults(value.toLowerCase());
                        });
                      },
                    ),
                  ),
                ],
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : NoteSectionAll(),
            ],
          ),
        ),
      ),
    );
  }

  Widget NoteSectionAll() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "SEARCH RESULTS",
                      style: TextStyle(
                          color: white.withOpacity(0.5),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: MasonryGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  itemCount: SearchResultNotes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteView(
                            note: SearchResultNotes[index]!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: white.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            SearchResultNotes[index]!.title,
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            SearchResultNotes[index]!.content.length > 200
                                ? "${SearchResultNotes[index]!.content.substring(0, 250)}...."
                                : SearchResultNotes[index]!.content,
                            style: const TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
