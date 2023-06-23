import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_notes_lite/CreateNoteView.dart';
import 'package:google_notes_lite/NoteView.dart';
import 'package:google_notes_lite/SideMenuBar.dart';
import 'package:google_notes_lite/colors.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({super.key});

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note =
      "This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE This IS NOTE";
  String note1 = "This IS NOTE This IS NOTE This IS NOTE";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateNoteView(),
              ));
        },
        child: Icon(
          Icons.add,
          color: white,
          size: 45,
        ),
        backgroundColor: cardColor,
      ),
      endDrawerEnableOpenDragGesture: true,
      key: _drawerKey,
      drawer: const SideMenu(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: BoxDecoration(
                  color: cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _drawerKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Search Your Notes",
                              style: TextStyle(
                                  color: white.withOpacity(0.5), fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                              (states) => white.withOpacity(0.1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.grid_view,
                            color: white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "ALL",
                              style: TextStyle(
                                  color: white.withOpacity(0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: MasonryGridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              itemCount: 10,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NoteView(),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: white.withOpacity(0.4),
                                      ),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "HEADING",
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        index.isEven
                                            ? note.length > 200
                                                ? "${note.substring(0, 250)}...."
                                                : note
                                            : note1,
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
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "LIST VIEW",
                              style: TextStyle(
                                color: white.withOpacity(0.5),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const NoteView(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  // margin: const EdgeInsets.only(bottom: 12),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: white.withOpacity(0.4),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "HEADING",
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        index.isEven
                                            ? note.length > 200
                                                ? "${note.substring(0, 250)}...."
                                                : note
                                            : note1,
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
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

                      // const SizedBox(height: 30),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(vertical: 15),
                      //   child: MasonryGridView.count(
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 12,
                      //     mainAxisSpacing: 12,
                      //     itemCount: 10,
                      //     shrinkWrap: true,
                      //     itemBuilder: (context, index) => Container(
                      //       padding: const EdgeInsets.all(10),
                      //       decoration: BoxDecoration(
                      //           color: index.isEven
                      //               ? Colors.green[900]
                      //               : Colors.blue[900],
                      //           border: Border.all(
                      //             color: index.isEven
                      //                 ? Colors.green.withOpacity(0.4)
                      //                 : Colors.blue.withOpacity(0.4),
                      //           ),
                      //           borderRadius: BorderRadius.circular(7)),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const Text(
                      //             "HEADING",
                      //             style: TextStyle(
                      //               color: white,
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //           const SizedBox(height: 8),
                      //           Text(
                      //             index.isEven
                      //                 ? note.length > 200
                      //                     ? "${note.substring(0, 250)}...."
                      //                     : note
                      //                 : note1,
                      //             style: const TextStyle(color: white),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),