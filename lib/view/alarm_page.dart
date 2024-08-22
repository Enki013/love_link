import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Gönderme'),
      ),
      body: Center(
        child: const Text('Alarm Gönderme İçeriği Buraya Gelecek'),
      ),
    );
  }
}