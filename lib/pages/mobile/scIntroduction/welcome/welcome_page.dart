import 'package:flutter/material.dart';
import 'package:laborus_app/pages/mobile/scIntroduction/welcome/widgets/build_bottom_buttons.dart';
import 'package:laborus_app/pages/mobile/scIntroduction/welcome/widgets/build_image_section.dart';
import 'package:laborus_app/pages/mobile/scIntroduction/welcome/widgets/build_text_section.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          buildImageSection(width),
          buildTextSection(context),
          const Spacer(),
          buildBottomButtons(width, context),
        ],
      ),
    );
  }
}
