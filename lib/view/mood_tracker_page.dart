import 'package:flutter/material.dart';

class MoodTrackerPage extends StatelessWidget {
  const MoodTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
      ),
      body: Center(
        child: const Text('Mood Tracker İçeriği Buraya Gelecek'),
      ),
    );
  }
}