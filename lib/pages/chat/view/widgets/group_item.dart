import 'package:flutter/material.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 3),
              shape: BoxShape.circle,
              color: Theme.of(context).appBarTheme.backgroundColor),
        ),
        avatar(context, image)
      ],
    );
  }
}

Widget avatar(BuildContext ctx, String image) {
  if (image.isEmpty) {
    return Positioned(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(ctx).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  } else {
    return Positioned(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(ctx).colorScheme.primary,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
