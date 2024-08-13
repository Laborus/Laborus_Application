class Comment {
  String user;
  String text;

  Comment({
    required this.user,
    required this.text,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      user: map['user'],
      text: map['text'],
    );
  }
}
