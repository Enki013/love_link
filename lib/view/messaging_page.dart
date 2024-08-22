import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  final List<types.Message> _messages = [];
  final types.User _user = const types.User(id: 'user1');
  final ImagePicker _picker = ImagePicker();
  final Uuid _uuid = const Uuid();

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: _uuid.v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });
  }

  void _handleImageSelection() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imageMessage = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: _uuid.v4(),
        name: image.name,
        size: await image.length(),
        uri: image.path,
      );

      setState(() {
        _messages.insert(0, imageMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesajlaşma'),
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        onAttachmentPressed: _handleImageSelection,
        theme: DefaultChatTheme(
          primaryColor: Colors.pink,
          secondaryColor: Colors.pinkAccent,
        ),
      ),
    );
  }
}