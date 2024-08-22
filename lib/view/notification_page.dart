import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirim Gönderme'),
      ),
      body: Center(
        child: const Text('Bildirim Gönderme İçeriği Buraya Gelecek'),
      ),
    );
  }
}