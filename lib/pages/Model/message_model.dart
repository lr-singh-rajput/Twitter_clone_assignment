// message_model.dart
// Dummy message data for the Messages tab

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

List<Message> messages = [
  Message(sender: "john_doe", text: "Hey! What's up?"),
  Message(sender: "flutter_girl", text: "Check this out!"),
  Message(sender: "openai_dev", text: "How's the app coming along?"),
];
