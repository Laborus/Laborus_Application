import 'package:flutter/material.dart';
import 'package:laborus_app/pages/CYA/components/option_component.dart';
import 'package:laborus_app/pages/CYA/widgets/build_text_section.dart';

class ChooseYourAccountPage extends StatelessWidget {
  const ChooseYourAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          buildTextSection(context),
          const SizedBox(height: 34),
          Column(
            children: [
              OptionComponent(
                text: 'Estudante',
                imageAsset: 'assets/img/student.png',
                width: MediaQuery.of(context).size.width * .8,
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
