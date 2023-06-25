import 'package:flutter/material.dart';
import 'package:google_notes_lite/ArchiveView.dart';
import 'package:google_notes_lite/Setting.dart';
import 'package:google_notes_lite/colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: bgColor),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30,bottom: 16,left: 20),
                child: const Text(
                  "Google Keep",
                  style: TextStyle(
                      color: white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              sectioNotes(),
              sectionArchive(),
              sectionSetting(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectioNotes() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.orangeAccent.withOpacity(0.3),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            )),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: [
              Icon(
                Icons.lightbulb,
                size: 20,
                color: white,
              ),
              const SizedBox(width: 20),
              Text(
                "Notes",
                style: TextStyle(
                  color: white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionArchive() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArchiveView(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.archive_outlined,
                size: 20,
                color: white,
              ),
              const SizedBox(width: 20),
              Text(
                "Archive",
                style: TextStyle(
                  color: white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionSetting() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Settings(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: const Row(
            children: [
              Icon(
                Icons.settings_outlined,
                size: 20,
                color: white,
              ),
              SizedBox(width: 20),
              Text(
                "Settings",
                style: TextStyle(
                  color: white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
