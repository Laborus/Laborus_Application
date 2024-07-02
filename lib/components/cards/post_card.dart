import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/model/laborus/post.dart';
import 'package:laborus_app/components/generics/readmore.dart';
import 'package:laborus_app/widgets/button_comment.dart';
import 'package:laborus_app/widgets/button_like.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        context.goNamed('post', extra: post);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 13, left: 8, right: 8),
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 13,
                bottom: 13,
                right: 21,
                left: 21,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPostHeader(context),
                  const Divider(),
                  const SizedBox(height: 13),
                  _buildPostContent(context),
                  const SizedBox(height: 13),
                  _buildPostImage(),
                  const SizedBox(height: 13),
                  const Divider(),
                  _buildPostActions(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const IconButton(
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/img/profile.jpg'),
              ),
              onPressed: null,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name, // Usar o nome do usuário do post
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.school,
                      size: 12,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      post.user
                          .institution, // Usar a instituição do usuário do post
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }

  Widget _buildPostContent(BuildContext context) {
    return ReadMoreText(
      post.text,
      trimLines: 3,
      callback: (val) {
        context.goNamed('chat');
      },
      textAlign: TextAlign.left,
      colorClickableText: Theme.of(context).colorScheme.tertiary,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Ler Mais',
      moreStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.tertiaryContainer,
      ),
    );
  }

  Widget _buildPostImage() {
    return Image.asset(
      post.media,
      height: 280,
      width: double.infinity,
    );
  }

  Widget _buildPostActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonLike(post: post),
        buttonComment(context, post),
      ],
    );
  }
}
