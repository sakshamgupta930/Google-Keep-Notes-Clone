import 'package:flutter/material.dart';
import 'package:google_notes_lite/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: bgColor,
        elevation: 0.0,
        title: const Text(
          "Settings",
          style: TextStyle(color: white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: bgColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sync",
                  style: TextStyle(color: white, fontSize: 20),
                ),
                Switch.adaptive(
                  value: value,
                  onChanged: (Switchvalue) {
                    setState(() {
                      this.value = Switchvalue;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
