import 'package:laborus_app/model/comments.dart';
import 'package:laborus_app/model/post.dart';
import 'package:laborus_app/model/user.dart';

List<Post> posts = [
  Post(
    id: "1",
    user: User(id: "user1", name: "Gustavo", institution: "Fatec Carapicuiba"),
    text: "Este é um post de exemplo.",
    media: "assets/img/landscape.png",
    code: "console.log('Hello, world!');",
    visibility: "public",
    likesCount: 10,
    comments: [
      Comment(user: "user2", text: "Ótimo post!"),
      Comment(user: "user3", text: "Eu também concordo."),
    ],
    reportCount: 2,
    shares: ["user2", "user3"],
    savedBy: ["user1", "user3"],
    likedBy: [],
  ),
  Post(
    id: "2",
    user: User(id: "user2", name: "Murilo", institution: "Fatec Carapicuiba"),
    text: "Outro post interessante.",
    media: "assets/img/landscape.png",
    code: "",
    visibility: "private",
    likesCount: 5,
    comments: [
      Comment(user: "user1", text: "Muito legal!"),
      Comment(user: "user3", text: "Isso é incrível."),
    ],
    reportCount: 1,
    shares: ["user1", "user3"],
    savedBy: ["user2", "user3"],
    likedBy: [],
  ),
];
