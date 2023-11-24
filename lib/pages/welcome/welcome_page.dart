import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/img/slide1.png',
    'assets/img/slide2.png',
    'assets/img/slide3.png',
  ];

  final titles = ['Laborus', 'Compartilhe', 'Interaja'];

  void refresh() {
    setState(() {});
    if (activeIndex == urlImages.length - 1) {
      context.goNamed('feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Sua plataforma de ',
          style: TextStyle(
            color: Provider.of<PalletTheme>(context).neutral500,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'gestão acadêmica ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Provider.of<PalletTheme>(context).neutral600),
            ),
            const TextSpan(text: 'e '),
            TextSpan(
              text: 'oportunidades profissionais!',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Provider.of<PalletTheme>(context).neutral600),
            )
          ],
        ),
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Compartilhe',
          style: TextStyle(
            color: Provider.of<PalletTheme>(context).neutral500,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: ' trabalhos acadêmicos ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Provider.of<PalletTheme>(context).neutral600),
            ),
            const TextSpan(text: 'e '),
            TextSpan(
              text: 'converse ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Provider.of<PalletTheme>(context).neutral600),
            ),
            const TextSpan(text: 'com outros estudantes.'),
          ],
        ),
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Encontre novas pessoas e ',
          style: TextStyle(
            color: Provider.of<PalletTheme>(context).neutral500,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'faça amizades ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Provider.of<PalletTheme>(context).neutral600),
            ),
            const TextSpan(text: 'com base nos '),
            TextSpan(
              text: 'interesses ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Provider.of<PalletTheme>(context).neutral600),
            ),
            const TextSpan(text: 'similares')
          ],
        ),
      ),
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
              buildIndicator()
            ],
          ),
          ElevatedButton(
            onPressed:
                activeIndex == urlImages.length - 1 ? () => refresh() : null,
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              alignment: Alignment.center,
              child: const Text(
                'Continuar',
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
          dotWidth: 15,
          activeDotColor: Theme.of(context).colorScheme.tertiary,
        ),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildContainer(String urlImage, String title, Widget label, int index,
        BuildContext ctx) =>
    SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(urlImage, fit: BoxFit.cover),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 20),
          label
        ],
      ),
    );
