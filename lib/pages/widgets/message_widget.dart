// message_widget.dart
// UI for displaying a single message item

import 'package:flutter/material.dart';
import '../Model/message_model.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        message.sender,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(message.text),
      onTap: () {
        // Open chat screen (if built)
      },
    );
  }
}
