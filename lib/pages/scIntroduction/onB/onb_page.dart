import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/data/local_database.dart';
import 'package:laborus_app/pages/scIntroduction/onB/widgets/build_continue_button.dart';
import 'package:laborus_app/pages/scIntroduction/onB/widgets/build_indicator.dart';
import 'package:laborus_app/pages/scIntroduction/onB/widgets/build_slide.dart';
import 'package:laborus_app/pages/scIntroduction/onB/widgets/build_text_rich.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  void checkOnboarding() async {
    final onboardingShown = await LocalDatabase.isOnboardingShown();
    if (onboardingShown) {
      // ignore: use_build_context_synchronously
      context.goNamed('welcome');
    } else {
      // ignore: use_build_context_synchronously
      context.goNamed('onboarding');
    }
  }

  @override
  void initState() {
    super.initState();
    checkOnboarding();
  }

  void refresh() async {
    await LocalDatabase.setOnboardingShown();
    // ignore: use_build_context_synchronously
    context.goNamed('welcome');
  }

  Function()? refreshButton() {
    setState(() {});
    if (activeIndex == urlImages.length - 1) {
      return () => refresh();
    }
    return null;
  }

  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/img/slide1.png',
    'assets/img/slide2.png',
    'assets/img/slide3.png',
  ];

  final titles = ['Laborus', 'Compartilhe', 'Interaja'];

  @override
  Widget build(BuildContext context) {
    final labels = [
      buildRichText([
        'Sua plataforma de ',
        'gestão acadêmica ',
        'e',
        ' oportunidades profissionais!'
      ], [
        false,
        true,
        false,
        true
      ], context),
      buildRichText([
        'Compartilhe ',
        'trabalhos acadêmicos ',
        'e ',
        'converse ',
        'com outros estudantes.'
      ], [
        false,
        true,
        false,
        true,
        false
      ], context),
      buildRichText([
        'Encontre novas pessoas e ',
        'faça amizades ',
        'com base nos ',
        'interesses',
        ' similares'
      ], [
        false,
        true,
        false,
        true,
        false,
      ], context),
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  final label = labels[index];
                  final title = titles[index];
                  return buildContainer(urlImage, title, label, index, context);
                },
                options: CarouselOptions(
                  height: 320,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  clipBehavior: Clip.none,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
              ),
              const SizedBox(height: 24),
              buildIndicator(activeIndex, urlImages, controller, context)
            ],
          ),
          buildContinueButton(activeIndex, urlImages, refreshButton, context)
        ],
      ),
    );
  }
}
