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
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 14,
                ),
                child: const Text(
                  "Google Keep",
                  style: TextStyle(
                      color: white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: white.withOpacity(0.2),
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
      padding: const EdgeInsets.symmetric(vertical: 5),
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
                size: 25,
                color: white.withOpacity(0.7),
              ),
              const SizedBox(width: 20),
              Text(
                "Notes",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 18,
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
                size: 25,
                color: white.withOpacity(0.7),
              ),
              const SizedBox(width: 20),
              Text(
                "Archive",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 18,
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
          child: Row(
            children: [
              Icon(
                Icons.settings_outlined,
                size: 25,
                color: white.withOpacity(0.7),
              ),
              const SizedBox(width: 20),
              Text(
                "Settings",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
