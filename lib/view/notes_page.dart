import 'package:flutter/material.dart';
import 'package:linkify_plus/linkify_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Günlere Özel Notlar'),
      ),
      body: Center(
        child: SelectableLinkify(
          text: "Bu bir https://flutter.dev linkidir.",
          onOpen: (link) async {
            if (await canLaunch(link.url)) {
              await launch(link.url);
            } else {
              throw 'Could not launch $link';
            }
          },
        ),
      ),
    );
  }
}