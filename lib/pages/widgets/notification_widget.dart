// notification_widget.dart
// Displays a single notification item

import 'package:flutter/material.dart';
import '../Model/notification_model.dart';

class NotificationWidget extends StatelessWidget {
  final AppNotification notification;

  const NotificationWidget({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: notification.profileImageUrl != null
            ? NetworkImage(notification.profileImageUrl!)
            : null,
        child: notification.profileImageUrl == null ? Icon(Icons.person) : null,
      ),
      title: Text(
        notification.username,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(notification.action),
      onTap: () {
        // Optional: Navigate or show more details
      },
    );
  }
}
