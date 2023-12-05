import 'package:flutter/material.dart';
import 'package:laborus_app/model/post.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class ButtonLike extends StatefulWidget {
  final Post post;
  const ButtonLike({super.key, required this.post});

  @override
  State<ButtonLike> createState() => _ButtonLikeState();
}

class _ButtonLikeState extends State<ButtonLike> {
  @override
  Widget build(BuildContext context) {
    bool liked = widget.post.liked('userId');
    return Tooltip(
      message: 'curtir',
      child: TextButton.icon(
        onPressed: () {
          widget.post.like('userId');
          setState(() {});
        },
        icon: Icon(
          liked
              ? Icons.thumb_up_off_alt_outlined
              : Icons.thumb_up_off_alt_sharp,
          color: liked
              ? Provider.of<PalletTheme>(context).neutral700
              : Theme.of(context).colorScheme.tertiary,
        ),
        label: Text(
          widget.post.likesCount.toString(),
          style: TextStyle(
            color: liked
                ? Provider.of<PalletTheme>(context).neutral700
                : Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ),
    );
  }
}
