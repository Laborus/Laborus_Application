import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/model/laborus/comments.dart';
import 'package:laborus_app/model/laborus/post.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ButtonComment extends StatelessWidget {
  final Post post;
  const ButtonComment({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    void showOptionsBottomSheet() {
      showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * .3,
          maxHeight: MediaQuery.of(context).size.height * .8,
        ),
        builder: (BuildContext context) {
          return Column(
            children: [
              Container(
                color: Provider.of<PalletTheme>(context).neutral0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 15),
                      color: Provider.of<PalletTheme>(context).neutral200,
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/img/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color:
                                  Provider.of<PalletTheme>(context).neutral300,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const TextField(
                              style: TextStyle(),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                hintText: 'Adicionar comentário...',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: post.comments.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 13),
                      itemBuilder: (BuildContext context, int index) {
                        Comment comment = post.comments[index];
                        return ListTile(
                          leading: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/img/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 30,
                            height: 30,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(comment.user),
                              Row(
                                children: [
                                  Icon(
                                    Icons.school,
                                    size: 12,
                                    color: Provider.of<PalletTheme>(context)
                                        .neutral700,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    post.user.institution,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Provider.of<PalletTheme>(context)
                                          .neutral700,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16)
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReadMoreText(
                                comment.text,
                                trimLines: 3,
                                textAlign: TextAlign.left,
                                colorClickableText:
                                    Theme.of(context).colorScheme.tertiary,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Ler Mais',
                                trimExpandedText: 'Mostrar menos',
                                moreStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<PalletTheme>(context)
                                      .neutral700,
                                ),
                              ),
                              const SizedBox(height: 13),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.thumb_up_off_alt_outlined,
                                    size: 16,
                                  ),
                                  SizedBox(width: 21),
                                  Icon(
                                    Icons.messenger_outline_rounded,
                                    size: 16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return Tooltip(
      message: 'comentar',
      child: TextButton.icon(
        onPressed: showOptionsBottomSheet,
        icon: Icon(
          Icons.messenger_outline_rounded,
          color: Provider.of<PalletTheme>(context).neutral700,
        ),
        label: Text(
          post.comments.length.toString(),
          style: TextStyle(
            color: Provider.of<PalletTheme>(context).neutral700,
          ),
        ),
      ),
    );
  }
}

Widget buttonComment(BuildContext context, Post post) {
  return Tooltip(
    message: 'comentar',
    child: TextButton.icon(
      onPressed: () {
        context.goNamed('post', extra: post);
      },
      icon: Icon(
        Icons.messenger_outline_rounded,
        color: Provider.of<PalletTheme>(context).neutral700,
      ),
      label: Text(
        post.comments.length.toString(),
        style: TextStyle(
          color: Provider.of<PalletTheme>(context).neutral700,
        ),
      ),
    ),
  );
}
