import 'package:laborus_app/model/comments.dart';
import 'package:laborus_app/model/user.dart';

class Post {
  final String id;
  final User user;
  final String text;
  final String media;
  final String code;
  final String visibility;
  int likesCount;
  final List<Comment> comments;
  final int reportCount;
  final List<String> shares;
  final List<String> savedBy;
  final List<String> likedBy;

  Post({
    required this.id,
    required this.user,
    required this.text,
    required this.media,
    required this.code,
    required this.visibility,
    required this.likesCount,
    required this.comments,
    required this.reportCount,
    required this.shares,
    required this.savedBy,
    required this.likedBy,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['_id'],
      user: map['user'],
      text: map['text'],
      media: map['media'],
      code: map['code'],
      visibility: map['visibility'],
      likesCount: map['likesCount'],
      comments: List<Comment>.from(
        map['comments'].map((comment) => Comment.fromMap(comment)),
      ),
      reportCount: map['reportCount'],
      shares: List<String>.from(map['shares']),
      savedBy: List<String>.from(map['savedBy']),
      likedBy: List<String>.from(map['likedBy']),
    );
  }

  bool liked(String userId) {
    if (!likedBy.contains(userId)) {
      return true;
    }
    return false;
  }

  void like(String userId) {
    if (!likedBy.contains(userId)) {
      likedBy.add(userId);
      likesCount++;
    } else {
      likedBy.remove(userId);
      likesCount--;
    }
  }
}
