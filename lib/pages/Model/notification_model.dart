// notification_model.dart
// Model for notifications and dummy data

class AppNotification {
  final String username;
  final String action; // e.g., "liked your post"
  final String? profileImageUrl;

  AppNotification({
    required this.username,
    required this.action,
    this.profileImageUrl,
  });
}

// Dummy notifications
List<AppNotification> notifications = [
  AppNotification(
    username: "john_doe",
    action: "liked your post",
    profileImageUrl: "https://via.placeholder.com/50", // optional
  ),
  AppNotification(
    username: "tech_girl",
    action: "commented: Awesome!",
  ),
  AppNotification(
    username: "dev_rahul",
    action: "started following you",
  ),
];
