import 'package:flutter/material.dart';

class AvatarPicture extends StatelessWidget {
  final double size;
  final String imagePath;
  final VoidCallback? onTap;

  const AvatarPicture({
    Key? key,
    required this.size,
    required this.imagePath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}
