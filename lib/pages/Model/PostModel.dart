class Post {
  final String username;
  final String text;
  final String? imageUrl;

  Post({
    required this.username,
    required this.text,
    this.imageUrl,
  });
}

List<Post> userPosts = [
  Post(
    username: "john_doe",
    text: "Hello Twitter clone! 🚀",
  ),
  Post(
    username: "tech_girl",
    text: "Check out this cool pic!",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjnWGDQvQ17wXwNaS8HVieUx_njLw-31tQsQ&s",
  ),
  Post(
    username: "dev_rahul",
    text: "Flutter is 🔥🔥🔥",
  ),
  Post(
    username: "john_doe",
    text: "Hello Twitter clone! 🚀",
  ),
  Post(
    username: "tech_girl",
    text: "Check out this cool pic!",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjnWGDQvQ17wXwNaS8HVieUx_njLw-31tQsQ&s",
  ),
  Post(
    username: "dev_rahul",
    text: "Flutter is 🔥🔥🔥",
  ),
];
