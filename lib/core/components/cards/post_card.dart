import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/model/laborus/post.dart';
import 'package:laborus_app/core/components/generics/readmore.dart';
import 'package:laborus_app/core/components/cards/button_comment.dart';
import 'package:laborus_app/core/components/cards/button_like.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        context.goNamed('post', extra: post);
      },
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        width: double.infinity,
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
            _buildPostActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPostHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 21),
      child: Row(
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
                    post.user.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
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
      ),
    );
  }

  Widget _buildPostContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 21),
      child: ReadMoreText(
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
      ),
    );
  }

  Widget _buildPostImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          post.media,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildPostActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonLike(post: post),
          buttonComment(context, post),
        ],
      ),
    );
  }
}
